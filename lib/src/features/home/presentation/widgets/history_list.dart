import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dermascan/src/core/router/route_name.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/shared/presentation/bloc/diagnose_history/diagnose_history_bloc.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/history_card.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/title_section.dart';
import 'package:go_router/go_router.dart';

class HistoryList extends StatefulWidget {
  final int count;
  const HistoryList({super.key, this.count = 4});

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleSection(
          title: 'Riwayat Diagnosa',
          onPressed: () {
            context.pushNamed(RouteName.diagnoseHistoryPage);
          },
        ),

        BlocConsumer<DiagnoseHistoryBloc, DiagnoseHistoryState>(
          listener: (context, state) {},
          builder: (context, state) {
            switch (state) {
              case LoadingGetDiagnoseHistory():
                return Center(
                  child: CircularProgressIndicator(
                    color: DefaultColors.primaryBlue,
                  ),
                );
              case SuccessGetDiagnoseHistory(:final listDiagnoseHistoryEntity):
                return listDiagnoseHistoryEntity.isEmpty
                    ? const SizedBox(
                      height: 200,
                      child: Center(
                        child: Text(
                          'Tidak ada riwayat diagnosa',
                          style: TextStyle(
                            fontSize: FontSize.standardUp,
                            fontWeight: FontWeight.w400,
                            color: DefaultColors.grey,
                          ),
                        ),
                      ),
                    )
                    : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          listDiagnoseHistoryEntity.length > widget.count
                              ? widget.count
                              : listDiagnoseHistoryEntity.length,
                      itemBuilder: (context, index) {
                        final diagnoseHistoryEntity =
                            listDiagnoseHistoryEntity[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: HistoryCard(
                            diagnoseHistoryEntity: diagnoseHistoryEntity,
                            onPressed: () {
                              context.pushNamed(
                                RouteName.diagnoseDetailHistoryPage,
                                extra: diagnoseHistoryEntity,
                              );
                            },
                          ),
                        );
                      },
                    );
              case ErrorGetDiagnoseHistory(:final failure):
                return Center(child: Text('${failure.message}'));
            }
            return Center(child: Text(''));
          },
        ),
      ],
    );
  }
}
