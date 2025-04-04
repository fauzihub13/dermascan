import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/features/scan/data/datasources/classification_image_data_source.dart';
import 'package:flutter_dermascan/src/features/scan/data/repositories/classification_repository_impl.dart';
import 'package:flutter_dermascan/src/features/scan/domain/repositories/classification_repository.dart';
import 'package:flutter_dermascan/src/features/scan/domain/usecases/classify_image_use_case.dart';
import 'package:flutter_dermascan/src/features/scan/presentation/widgets/save_diagnose_dialog.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_appbar.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_button.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_snackbar.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class DetailDiagnosePage extends StatefulWidget {
  final String imagePath;
  const DetailDiagnosePage({super.key, required this.imagePath});

  @override
  State<DetailDiagnosePage> createState() => _DetailDiagnosePageState();
}

class _DetailDiagnosePageState extends State<DetailDiagnosePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<double> tabHeights = [0, 0, 0, 0];
  final TextEditingController labelController = TextEditingController();
  String priority = '';

  // MODEL
  Interpreter? interpreter;
  List<String> labels = [];
  List<Map<String, dynamic>> topResults = [];
  List<Map<String, dynamic>> classifiedResults = [];

  late ClassificationRepository classificationRepository;
  late ClassifyImageUseCase classifyImageUseCase;
  bool isModelLoaded = false; // Untuk tracking apakah model berhasil dimuat

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });

    _initClassification();
    super.initState();
  }

  Future<void> _initClassification() async {
    final dataSource = ClassificationImageDataSource();
    classificationRepository = ClassificationRepositoryImpl(dataSource);
    classifyImageUseCase = ClassifyImageUseCase(classificationRepository);

    // Load model dan label sebelum klasifikasi
    final initResult = await classificationRepository.init();
    initResult.fold(
      (failure) {
        print("❌ Failed to load model/labels: ${failure.message}");
      },
      (_) {
        print("✅ Model and labels loaded successfully!");
        setState(() {
          isModelLoaded = true; // Update UI jika model berhasil dimuat
        });
        _classifyImage();
      },
    );
  }

  Future<void> _classifyImage() async {
    if (!isModelLoaded) {
      print("⚠️ Model not loaded yet!");
      return;
    }

    String imagePath = widget.imagePath; // Ganti dengan path gambar yang valid
    final result = await classifyImageUseCase.call(imagePath);

    result.fold(
      (failure) {
        print("❌ Classification failed: ${failure.message}");
      },
      (classificationResult) {
        print("✅ Classification success: ${classificationResult.results}");
        setState(() {
          classifiedResults = classificationResult.results;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    CroppedFile croppedFile = CroppedFile(widget.imagePath);
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: FileImage(File(croppedFile.path)),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  classifiedResults.isNotEmpty
                      ? classifiedResults.first['label']
                      : '-',
                  textAlign: TextAlign.start,
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
                      classifiedResults.isNotEmpty
                          ? '${classifiedResults.first['confidence'].toStringAsFixed(2)}%'
                          : '0%',
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
