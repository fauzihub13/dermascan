import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dermascan/src/core/router/route_name.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/features/home/presentation/widgets/history_list.dart';
import 'package:flutter_dermascan/src/features/home/presentation/widgets/history_statistic_card.dart';
import 'package:flutter_dermascan/src/features/home/presentation/widgets/main_appbar.dart';
import 'package:flutter_dermascan/src/shared/presentation/bloc/bloc/local_auth_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    context.read<LocalAuthBloc>().add(LocalAuthEvent.getLocalAuth());
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
              HistoryStatisticCard(
                onPressed: () {
                  context.pushNamed(RouteName.diagnoseHistoryPage);
                },
                count: 2,
                lastCheck: '20 hari yang lalu',
              ),
              HistoryList(),
            ],
          ),
        ),
      ),
    );
  }
}
