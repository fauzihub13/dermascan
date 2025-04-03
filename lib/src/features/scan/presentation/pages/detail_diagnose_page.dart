import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dermascan/src/core/utils/constant.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
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
  List<Map<String, dynamic>> topResults = []; // Simpan hasil klasifikasi

  @override
  void initState() {
    _initializeModel();
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  Future<void> _initializeModel() async {
    await _loadModel();
    await _loadLabels();
    await classifyImage(
      widget.imagePath,
    ); // Pastikan model sudah siap sebelum klasifikasi
  }

  Future<void> _loadModel() async {
    try {
      interpreter = await Interpreter.fromAsset(Constant.modelPath);
      print('✅ Model loaded successfully!');
    } catch (e) {
      print('❌ Error loading model: $e');
    }
  }

  // Load labels from assets
  Future<void> _loadLabels() async {
    try {
      final labelTxt = await rootBundle.loadString(Constant.labelsPath);
      labels = labelTxt.split('\n').where((label) => label.isNotEmpty).toList();
      print('✅ Labels loaded successfully! Total labels: ${labels.length}');
    } catch (e) {
      print('❌ Error loading labels: $e');
    }
  }

  Future<void> classifyImage(String imagePath) async {
    if (interpreter == null || labels.isEmpty) {
      print("❌ Model or labels not loaded yet!");
      return;
    }

    try {
      // Read image as bytes
      final Uint8List imageBytes = File(imagePath).readAsBytesSync();

      // Convert image to Float32 input tensor
      final input = imageToByteListFloat32(imageBytes, 224, 224, 3);

      // Ambil jumlah output classes dari model
      var outputShape = interpreter!.getOutputTensor(0).shape;
      int numClasses = outputShape[1]; // Ambil jumlah kelas dari model

      print('📌 Model expects $numClasses output classes');

      // Prepare output buffer dengan ukuran yang sesuai
      final output = List<List<double>>.generate(
        1,
        (_) => List.filled(numClasses, 0.0),
      );

      // Run inference
      interpreter!.run(input, output);

      // Process results
      final scores = output[0];
      print('=================');
      print(scores);
      print('=================');

      // Pastikan jumlah kelas cocok dengan labels
      if (labels.length != numClasses) {
        print(
          '⚠️ Warning: Model output classes ($numClasses) != Loaded labels (${labels.length})',
        );
      }

      // Get top 3 predictions
      final top3 = getTopKClasses(scores, 3);

      setState(() {
        topResults = top3;
      });

      // Print results
      for (var result in top3) {
        int index = result['index'];
        if (index < labels.length) {
          print("📌 Label: ${labels[index]}");
          print(
            "🎯 Confidence: ${(result['score'] * 100).toStringAsFixed(2)}%\n",
          );
        } else {
          print("⚠️ Warning: Index out of range (${result['index']})");
        }
      }
    } catch (e) {
      print("❌ Error during classification: $e");
    }
  }

  // Convert image to Float32 byte list
  Uint8List imageToByteListFloat32(
    Uint8List imageBytes,
    int width,
    int height,
    int channels,
  ) {
    var buffer = Float32List(width * height * channels);
    for (int i = 0; i < imageBytes.length && i < buffer.length; i++) {
      buffer[i] = imageBytes[i] / 255.0; // Normalize pixel values to [0,1]
    }
    return buffer.buffer.asUint8List();
  }

  // Get top K predictions
  List<Map<String, dynamic>> getTopKClasses(List<double> scores, int k) {
    List<Map<String, dynamic>> indexedScores = List.generate(
      scores.length,
      (i) => {'index': i, 'score': scores[i]},
    );

    // Sort by confidence score (Descending order)
    indexedScores.sort((a, b) => b['score'].compareTo(a['score']));

    return indexedScores.take(k).toList();
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
                   topResults.isNotEmpty
                      ? labels[topResults.first['index']]
                      : '',
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
                      topResults.isNotEmpty
                          ? '${(topResults.first['score'] * 100).toStringAsFixed(2)}%'
                          : '',
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
