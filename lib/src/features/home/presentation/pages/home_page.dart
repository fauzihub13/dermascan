import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dermascan/src/core/helper/time_ago_helper.dart';
import 'package:flutter_dermascan/src/core/router/route_name.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/features/home/presentation/widgets/history_list.dart';
import 'package:flutter_dermascan/src/features/home/presentation/widgets/history_statistic_card.dart';
import 'package:flutter_dermascan/src/features/home/presentation/widgets/main_appbar.dart';
import 'package:flutter_dermascan/src/shared/presentation/bloc/diagnose_history/diagnose_history_bloc.dart';
import 'package:flutter_dermascan/src/shared/presentation/bloc/local_auth/local_auth_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _initializeData();
    super.initState();
  }

  Future<void> _initializeData() async {
    context.read<LocalAuthBloc>().add(LocalAuthEvent.getLocalAuth());
    context.read<DiagnoseHistoryBloc>().add(
      DiagnoseHistoryEvent.getDiagnoseHistory(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: BlocConsumer<LocalAuthBloc, LocalAuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            String name = '-';
            switch (state) {
              case SuccesGetLocalAuth(:final userEntity):
                name = userEntity.name;
                break;
            }
            return MainAppbar(name: name);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingSize.horizontal,
          vertical: PaddingSize.vertical,
        ),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              Image.asset('assets/images/banner.png'),
              BlocBuilder<DiagnoseHistoryBloc, DiagnoseHistoryState>(
                builder: (context, state) {
                  int count = 0;
                  String lastCheck = '';
                  switch (state) {
                    case SuccessGetDiagnoseHistory(
                      :final listDiagnoseHistoryEntity,
                    ):
                      count = listDiagnoseHistoryEntity.length;
                      if (listDiagnoseHistoryEntity.isNotEmpty) {
                        lastCheck = TimeAgoHelper.timeAgo(
                          listDiagnoseHistoryEntity.last.createdAt,
                        );
                      }
                  }
                  return HistoryStatisticCard(
                    onPressed: () {
                      context.pushNamed(RouteName.diagnoseHistoryPage);
                    },
                    count: count,
                    lastCheck: lastCheck,
                  );
                },
              ),
              HistoryList(),
            ],
          ),
        ),
      ),
    );
  }
}
