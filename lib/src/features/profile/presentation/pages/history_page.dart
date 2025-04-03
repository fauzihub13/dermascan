import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/pages/detail_history_page.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_appbar.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/form_input.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/history_card.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final TextEditingController searchController = TextEditingController();

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
                hintText: 'Ketik disini..',
                prefixIcon: Icon(Icons.search),
              ),
              const SizedBox(height: 18),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 8);
                  },
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return HistoryCard(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return DetailHistoryPage();
                            },
                          ),
                        );
                      },
                    );
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
