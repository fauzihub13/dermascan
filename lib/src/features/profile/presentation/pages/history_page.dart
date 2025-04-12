import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dermascan/src/core/router/route_name.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/shared/domain/entities/diagnose_history_entity.dart';
import 'package:flutter_dermascan/src/shared/presentation/bloc/diagnose_history/diagnose_history_bloc.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_appbar.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/form_input.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/history_card.dart';
import 'package:go_router/go_router.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final TextEditingController searchController = TextEditingController();

  List<DiagnoseHistoryEntity> searchResults = [];

  void _onSearchChanged(String value) {
    setState(() {
      searchResults =
          searchResults
              .where((e) => e.label.toLowerCase().contains(value.toLowerCase()))
              .toList();
    });
  }

  @override
  void initState() {
    context.read<DiagnoseHistoryBloc>().add(
      DiagnoseHistoryEvent.getDiagnoseHistory(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Riwayat Diagnosa', canBack: true),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingSize.horizontal,
            vertical: PaddingSize.vertical,
          ),
          child: Column(
            children: [
              FormInput(
                controller: searchController,
                onChanged: _onSearchChanged,
                hintText: 'Ketik disini..',
                prefixIcon: Icon(Icons.search),
              ),
              const SizedBox(height: 18),
              Expanded(
                child: BlocConsumer<DiagnoseHistoryBloc, DiagnoseHistoryState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    switch (state) {
                      case LoadingGetDiagnoseHistory():
                        return Center(
                          child: CircularProgressIndicator(
                            color: DefaultColors.primaryBlue,
                          ),
                        );

                      case SuccessGetDiagnoseHistory(
                        :final listDiagnoseHistoryEntity,
                      ):
                        searchResults = listDiagnoseHistoryEntity;
                        final filteredDiagnoseHistory =
                            searchController.text.isEmpty
                                ? searchResults
                                : searchResults
                                    .where(
                                      (e) => e.label.toLowerCase().contains(
                                        searchController.text.toLowerCase(),
                                      ),
                                    )
                                    .toList();

                        return filteredDiagnoseHistory.isEmpty
                            ? const Center(
                              child: Text(
                                'Tidak ada riwayat diagnosa',
                                style: TextStyle(
                                  fontSize: FontSize.standardUp,
                                  fontWeight: FontWeight.w400,
                                  color: DefaultColors.grey,
                                ),
                              ),
                            )
                            : ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 8);
                              },
                              itemCount: filteredDiagnoseHistory.length,
                              itemBuilder: (context, index) {
                                final diagnoseHistoryEntity =
                                    filteredDiagnoseHistory[index];
                                return HistoryCard(
                                  diagnoseHistoryEntity: diagnoseHistoryEntity,
                                  onPressed: () {
                                    context.pushNamed(
                                      RouteName.diagnoseDetailHistoryPage,
                                      extra: diagnoseHistoryEntity,
                                    );
                                  },
                                );
                              },
                            );
                      case ErrorGetDiagnoseHistory(:final failure):
                        return Center(child: Text('${failure.message}',
                            style: TextStyle(
                              fontSize: FontSize.standardUp,
                              fontWeight: FontWeight.w400,
                              color: DefaultColors.grey,
                            ),
                          ));
                    }
                    return Center(child: Text(''));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
