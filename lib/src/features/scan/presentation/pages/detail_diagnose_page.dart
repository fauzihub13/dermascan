import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/features/scan/presentation/widgets/save_diagnose_dialog.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_appbar.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_button.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_snackbar.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';

class DetailDiagnosePage extends StatefulWidget {
  final CroppedFile image;
  const DetailDiagnosePage({super.key, required this.image});

  @override
  State<DetailDiagnosePage> createState() => _DetailDiagnosePageState();
}

class _DetailDiagnosePageState extends State<DetailDiagnosePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<double> tabHeights = [0, 0, 0, 0];
  final TextEditingController labelController = TextEditingController();
  String priority = '';

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Detail Diagnosa', canBack: true),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingSize.horizontal,
            vertical: PaddingSize.vertical,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // spacing: 12,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: FileImage(File(widget.image.path)),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  // Image.asset(
                  //   'assets/images/hand_disease.jpg',
                  //   width: MediaQuery.of(context).size.width,
                  //   height: MediaQuery.of(context).size.width,
                  //   fit: BoxFit.cover,
                  // ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Actinic Keratosis, Basal Cell Carcinoma, and other Malignant Lesions',
                  style: TextStyle(
                    fontSize: FontSize.diseaseName,
                    fontWeight: FontWeight.w600,
                    color: DefaultColors.darkBlue,
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
                      '78%',
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
                LayoutBuilder(
                  builder: (context, constraints) {
                    return SizedBox(
                      height: tabHeights[tabController.index],
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          _buildTabContent(
                            0,
                            'Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit. Blue Nature is a 5 star complemented with 80 well bedroom and suit. Blue Nature is a 5 star complemented with 80 well bedroom and suit. Blue Nature is a 5 star complemented with 80 well bedroom and suit. Blue Nature is a 5 star complemented with 80 well bedroom and suit. Blue Nature is a 5 star complemented with 80 well bedroom and suit. Blue Nature is a 5 star complemented with 80 well bedroom and suit. Blue Nature is a 5 star complemented with 80 well bedroom and suit. Blue Nature is a 5 star complemented with 80 well bedroom and suit. Blue Nature is a 5 star complemented with 80 well bedroom and suit. Blue Nature is a 5 star complemented with 80 well bedroom and suit. Blue Nature is a 5 star complemented with 80 well bedroom and suit. Blue Nature is a 5 star complemented with 80 well bedroom and suit. Blue Nature is a 5 star complemented with 80 well bedroom and suit.',
                          ),
                          _buildTabContent(
                            1,
                            'Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit.',
                          ),
                          _buildTabContent(
                            2,
                            'Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit.',
                          ),
                          _buildTabContent(
                            3,
                            'Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit, modern residence in a very strategic location from the city center. Blue Nature is a 5 star complemented with 80 well bedroom and suit.',
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingSize.horizontal,
          ),
          child: CustomButton.filled(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext dialogContext) {
                  return SaveDiagnoseDialog(
                    labelController: labelController,
                    onPressed: () {
                      CustomSnackbar.show(
                        context,
                        message: 'Berhasil meyimpan',
                        status: 'success',
                      );
                      context.pop();
                    },
                    onChanged: (value) {
                      setState(() {
                        priority = value;
                      });
                    },
                  );
                },
              );
            },
            label: 'Simpan Hasil',
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
            tabHeights[index] = textPainter.height;
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
