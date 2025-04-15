import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/core/utils/variables.dart';
import 'package:flutter_dermascan/src/features/scan/presentation/bloc/classify/classify_bloc.dart';
import 'package:flutter_dermascan/src/shared/domain/entities/diagnose_history_entity.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_appbar.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_snackbar.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/detail_diagnose_dialog.dart';

class DetailHistoryPage extends StatefulWidget {
  final DiagnoseHistoryEntity diagnoseHistoryEntity;
  const DetailHistoryPage({super.key, required this.diagnoseHistoryEntity});

  @override
  State<DetailHistoryPage> createState() => _DetailHistoryPageState();
}

class _DetailHistoryPageState extends State<DetailHistoryPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<double> tabHeights = [0, 0, 0, 0];

  @override
  void initState() {
    context.read<ClassifyBloc>().add(
      ClassifyEvent.getDetailDiagnose(
        diganose: widget.diagnoseHistoryEntity.classifyImageResults.first.label,
      ),
    );
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Detail Riwayat', canBack: true),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingSize.horizontal,
            vertical: PaddingSize.vertical,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    Variables.baseUrl + widget.diagnoseHistoryEntity.imagePath,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DetailDiagnoseDialog(
                          diagnoseHistoryEntity: widget.diagnoseHistoryEntity,
                        );
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget
                              .diagnoseHistoryEntity
                              .classifyImageResults
                              .first
                              .label,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: FontSize.diseaseName,
                            fontWeight: FontWeight.w600,
                            color: DefaultColors.darkBlue,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        size: 40,
                        color: DefaultColors.grey.withValues(alpha: 0.4),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      'Akurasi: ',
                      style: TextStyle(
                        fontSize: FontSize.standardUp,
                        fontWeight: FontWeight.w400,
                        color: DefaultColors.grey,
                      ),
                    ),
                    Text(
                      '${widget.diagnoseHistoryEntity.classifyImageResults.first.confidence.toStringAsFixed(2)}%',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: FontSize.standardUp,
                        fontWeight: FontWeight.w600,
                        color: DefaultColors.darkBlue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Divider(color: DefaultColors.lightGrey4),
                TabBar(
                  controller: tabController,

                  indicatorColor: DefaultColors.primaryBlue,
                  labelColor: DefaultColors.primaryBlue,
                  unselectedLabelColor: DefaultColors.navbarDisable,
                  dividerColor: DefaultColors.lightBlue,
                  padding: EdgeInsets.all(0),
                  isScrollable: true,
                  tabAlignment: TabAlignment.center,
                  tabs: [
                    Tab(text: 'Deskripsi'),
                    Tab(text: 'Penyebab'),
                    Tab(text: 'Gejala'),
                    Tab(text: 'Solusi'),
                  ],
                ),
                const SizedBox(height: 10),
                BlocConsumer<ClassifyBloc, ClassifyState>(
                  listener: (context, state) {
                    switch (state) {
                      case ErrorGetDetailDiagnose(:final failure):
                        CustomSnackbar.show(
                          context,
                          message: '${failure.message}',
                          status: 'fail',
                        );
                        break;
                    }
                  },
                  builder: (context, state) {
                    String description = '-';
                    String causes = '-';
                    String symptoms = '-';
                    String solutions = '-';
                    switch (state) {
                      case SuccessGetDetailDiagnose(
                        :final classificationDetailEntity,
                      ):
                        description = classificationDetailEntity.description;
                        causes = classificationDetailEntity.causes;
                        symptoms = classificationDetailEntity.symptoms;
                        solutions = classificationDetailEntity.solutions;
                    }
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        return SizedBox(
                          height: tabHeights[tabController.index],
                          child: TabBarView(
                            controller: tabController,
                            children: [
                              _buildTabContent(0, description),
                              _buildTabContent(1, causes),
                              _buildTabContent(2, symptoms),
                              _buildTabContent(3, solutions),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(int index, String text) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(
            text: text,
            style: const TextStyle(
              color: DefaultColors.grey,
              fontSize: FontSize.standardUp,
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            tabHeights[index] = textPainter.height * 1.4;
          });
        });

        return Text(
          text,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            color: DefaultColors.grey,
            fontSize: FontSize.standardUp,
          ),
        );
      },
    );
  }
}
