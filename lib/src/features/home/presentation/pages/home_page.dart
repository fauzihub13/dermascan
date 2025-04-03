import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/features/home/presentation/widgets/history_list.dart';
import 'package:flutter_dermascan/src/features/home/presentation/widgets/history_statistic_card.dart';
import 'package:flutter_dermascan/src/features/home/presentation/widgets/main_appbar.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/pages/history_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: MainAppbar(),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return HistoryPage();
                      },
                    ),
                  );
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
