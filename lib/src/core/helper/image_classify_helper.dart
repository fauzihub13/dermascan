import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart' as img;

class ImageClassifyHelper {

  static Future<Uint8List> preprocessImage(String imagePath) async {
    File file = File(imagePath);
    img.Image? image = img.decodeImage(await file.readAsBytes());

    if (image == null) throw Exception("Image decoding failed");

    img.Image resizedImage = img.copyResize(image, width: 224, height: 224);
    return imageToByteListFloat32(resizedImage, 224, 224, 3);
  }

  // GET 3 TOP RESULTS
  List<Map<String, dynamic>> getTopKClasses(List<double> scores, int k) {
    List<Map<String, dynamic>> indexedScores = List.generate(
      scores.length,
      (i) => {'index': i, 'score': scores[i]},
    );

    // Sort by confidence score (Descending order)
    indexedScores.sort((a, b) => b['score'].compareTo(a['score']));

    return indexedScores.take(k).toList();
  }

  // CONVERT IMAGE INTO FLOAT32 LIST
  static Uint8List imageToByteListFloat32(
    img.Image image,
    int width,
    int height,
    int channels,
  ) {
    var buffer = Float32List(1 * width * height * channels);
    int pixelIndex = 0;

    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        img.Pixel pixel = image.getPixelSafe(x, y);
        buffer[pixelIndex++] = pixel.r / 255.0;
        buffer[pixelIndex++] = pixel.g / 255.0;
        buffer[pixelIndex++] = pixel.b / 255.0;
      }
    }
    return buffer.buffer.asUint8List();
  }

}
