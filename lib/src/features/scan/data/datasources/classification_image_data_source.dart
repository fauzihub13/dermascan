import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dermascan/src/core/helper/image_classify_helper.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/core/utils/constant.dart';
import 'package:flutter_dermascan/src/features/scan/data/models/classification_result_model.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class ClassificationImageDataSource {
  Interpreter? interpreter;
  List<String> labels = [];
  List<Map<String, dynamic>> topResults = [];

  // LOAD TFLITE MODEL
  Future<Either<Failure, void>> loadModel() async {
    try {
      final options = InterpreterOptions();
      options.addDelegate(XNNPackDelegate());
      // options.addDelegate(GpuDelegateV2());

      interpreter = await Interpreter.fromAsset(
        Constant.modelPath,
        options: options,
      );
      // print('✅ Model loaded successfully!');
      return Right(null);
    } catch (e) {
      // print('❌ Error loading model: $e');
      return Left(Failure(message: e.toString()));
    }
  }

  // LOAD MODEL LABELS
  Future<Either<Failure, void>> loadLabels() async {
    try {
      final labelTxt = await rootBundle.loadString(Constant.labelsPath);
      labels = labelTxt.split('\n').where((label) => label.isNotEmpty).toList();
      // print('✅ Labels loaded successfully! Total labels: ${labels.length}');
      return Right(null);
    } catch (e) {
      // print('❌ Error loading labels: $e');
      return Left(Failure(message: e.toString()));
    }
  }

  Future<Either<Failure, ClassificationResultModel>> classifyImage({
    required String imagePath,
  }) async {
    if (interpreter == null || labels.isEmpty) {
      return Left(Failure(message: "Model or labels not loaded"));
    }

    // Load and preprocess image
    Uint8List input = await ImageClassifyHelper.preprocessImage(imagePath);

    // ✅ Ensure Correct Input Shape
    final inputTensor = interpreter!.getInputTensor(0);

    if (inputTensor.shape.length != 4 ||
        inputTensor.shape[1] != 224 ||
        inputTensor.shape[2] != 224 ||
        inputTensor.shape[3] != 3) {
      // print("❌ Input shape mismatch: Expected [1, 224, 224, 3]");
      return Left(
        Failure(message: "Input shape mismatch: Expected [1, 224, 224, 3]"),
      );
    }

    // Get output tensor shape
    var outputShape = interpreter!.getOutputTensor(0).shape;
    int numClasses = outputShape[1];

    // Prepare output buffer
    final output = List<List<double>>.generate(
      1,
      (_) => List.filled(numClasses, 0.0),
    );

    // Run inference
    interpreter!.run(input, output);

    // Process results
    final scores = output[0];

    topResults = ImageClassifyHelper().getTopKClasses(scores, 3);

    // Buat list baru yang menyimpan label dan confidence
    List<Map<String, dynamic>> classifiedResults = [];

    for (var result in topResults) {
      int index = result['index'];
      if (index < labels.length) {
        String label = labels[index];
        double confidence = result['score'] * 100;

        // print("📌 Label: $label");
        // print("🎯 Confidence: ${confidence.toStringAsFixed(2)}%\n");

        // Tambahkan hasil ke list baru
        classifiedResults.add({'label': label, 'confidence': confidence});
      } else {
        // print("⚠️ Warning: Index out of range (${result['index']})");
      }
    }

    return Right(ClassificationResultModel(results: classifiedResults));
  }

  void close() {
    interpreter?.close();
    interpreter = null;
  }
}
