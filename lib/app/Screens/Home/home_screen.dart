// ignore_for_file: use_build_context_synchronously

import 'package:einayaaminah/app/Screens/AskAi/ask_ai_screen.dart';
import 'package:einayaaminah/app/Screens/Home/Widgets/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/Services/Image processing/image_cropper_service.dart';
import '../../core/Services/Image processing/image_picker_service.dart';
import '../Results/results_screen.dart';
import 'Widgets/image_source_selector.dart';
import 'Widgets/pulsating_camera_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isBusy = false;
  String _recognizedText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isBusy
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                const Center(child: PulsatingCameraIcon()),
                GestureDetector(
                  onTap: () {
                    imagePickerModal(
                      context,
                      onCameraTap: () async {
                        String path =
                            await pickImage(source: ImageSource.camera);
                        if (path.isNotEmpty) {
                          String croppedPath =
                              await imageCropperView(path, context);
                          if (croppedPath.isNotEmpty) {
                            processImage(InputImage.fromFilePath(croppedPath));
                          }
                        }
                      },
                      onGalleryTap: () async {
                        String path =
                            await pickImage(source: ImageSource.gallery);
                        if (path.isNotEmpty) {
                          String croppedPath =
                              await imageCropperView(path, context);
                          if (croppedPath.isNotEmpty) {
                            processImage(InputImage.fromFilePath(croppedPath));
                          }
                        }
                      },
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                ),
              ],
            ),
      // Wrap the custom floating action button with a container to remove padding
      floatingActionButton: Container(
        margin: EdgeInsets.zero, // Remove margin
        child: CustomFloatingActionButton(
          onPressed: () {
            // Navigate to ChatPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChatPage()),
            );
          },
        ),
      ),
      // Set the floatingActionButtonLocation
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  void processImage(InputImage image) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    setState(() {
      _isBusy = true;
    });

    final RecognizedText recognizedText =
        await textRecognizer.processImage(image);

    _recognizedText = recognizedText.text;

    setState(() {
      _isBusy = false;
    });

    if (_recognizedText.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(text: _recognizedText),
        ),
      );
    }
  }
}
