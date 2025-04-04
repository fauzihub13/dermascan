import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_appbar.dart';

class ScanImagePage extends StatefulWidget {
  const ScanImagePage({super.key});

  @override
  State<ScanImagePage> createState() => _ScanImagePageState();
}

class _ScanImagePageState extends State<ScanImagePage> {
  List<CameraDescription> cameras = [];
  CameraController? cameraController;
  int currentCameraIndex = 0;

  Future<void> _setupCameraController() async {
    List<CameraDescription> detectCameras = await availableCameras();
    if (detectCameras.isNotEmpty) {
      setState(() {
        cameras = detectCameras;
        cameraController = CameraController(
          detectCameras[currentCameraIndex],
          ResolutionPreset.high,
        );
      });
      cameraController?.initialize().then((_) {
        setState(() {});
      });
    }
  }

  Future<void> _switchCamera() async {
    if (cameras.isNotEmpty) {
      currentCameraIndex = (currentCameraIndex + 1) % cameras.length;
      if (cameraController != null) {
        await cameraController!.dispose();
      }
      _setupCameraController();
    }
  }

  @override
  void initState() {
    _setupCameraController();
    super.initState();
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Pindai Diagnosa', canBack: true),
      body: SafeArea(child: Center(child: _cameraUI())),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
          color: DefaultColors.lightBlue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  color: DefaultColors.white,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.landscape,
                    color: DefaultColors.grey,
                    size: 30,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: ShapeDecoration(
                  shape: CircleBorder(
                    side: BorderSide(color: DefaultColors.lightGrey, width: 3),
                  ),
                  color: DefaultColors.white,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.camera, color: DefaultColors.grey, size: 40),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  color: DefaultColors.white,
                ),
                child: IconButton(
                  onPressed: () {
                    _switchCamera();
                  },
                  icon: Icon(Icons.loop, color: DefaultColors.grey, size: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cameraUI() {
    if (cameraController == null ||
        cameraController?.value.isInitialized == false) {
      return const CircularProgressIndicator(color: DefaultColors.primaryBlue);
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: DefaultColors.white,
        border: Border.all(width: 2, color: DefaultColors.white),
      ),
      child: CameraPreview(cameraController!),
    );
  }
}
