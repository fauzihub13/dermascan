import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/router/route_name.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ScanOptionDialog extends StatefulWidget {
  const ScanOptionDialog({super.key});

  @override
  State<ScanOptionDialog> createState() => _ScanOptionDialogState();
}

class _ScanOptionDialogState extends State<ScanOptionDialog> {
  
  void pickImage({required bool pickGalleryImage}) async {
    XFile? image;
    final picker = ImagePicker();

    // Pick Image
    if (pickGalleryImage == true) {
      image = await picker.pickImage(source: ImageSource.gallery);
    } else {
      image = await picker.pickImage(source: ImageSource.camera);
    }

    // Crop Image
    if (image != null) {
      final croppedImage = await cropImages(image);

      if (croppedImage != null && mounted) {
        Navigator.of(context).pop();
        context.pushNamed(
          RouteName.detailDiagnosePage,
          extra: croppedImage.path,
        );
      } else if (mounted) {
        context.pop(context);
      } else {
        return;
      }
    }
  }

  Future<CroppedFile?> cropImages(XFile image) async {
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: image.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Potong Gambar',
          toolbarColor: DefaultColors.primaryBlue,
          toolbarWidgetColor: DefaultColors.white,
          statusBarColor: DefaultColors.primaryBlue,
          backgroundColor: DefaultColors.white,
          activeControlsWidgetColor: DefaultColors.primaryBlue,
          initAspectRatio: CropAspectRatioPreset.ratio16x9,
          lockAspectRatio: true,
          aspectRatioPresets: [CropAspectRatioPreset.square],
        ),
      ],
    );
    return croppedImage;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Wrap(
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Opsi pindai',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: FontSize.standardUp2,
                  fontWeight: FontWeight.w700,
                  color: DefaultColors.darkBlue,
                ),
              ),
            ),
            CustomButton.filled(
              onPressed: () {
                pickImage(pickGalleryImage: false);
              },
              label: 'Camera',
              icon: Icon(Icons.camera, size: 20, color: DefaultColors.white),
            ),
            CustomButton.filled(
              onPressed: () {
                pickImage(pickGalleryImage: true);
              },
              label: 'Gallery',
              icon: Icon(Icons.image, size: 20, color: DefaultColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
