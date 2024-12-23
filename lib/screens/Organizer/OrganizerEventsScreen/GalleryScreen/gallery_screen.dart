import 'dart:io';
import 'package:brogam/providers/OraganizerProvider/AddEventProvider.dart';
import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CutomTextField/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../../../../widgets/DotedBorder/doted_border.dart';

class GalleryScreen extends StatefulWidget {
  final Function(String? imagePath, String? link)? onImageDataSubmitted;

  const GalleryScreen({super.key, this.onImageDataSubmitted});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final TextEditingController linkController = TextEditingController();

  @override
  void initState() {
    super.initState();

    String? selectedImagePath =
        context.read<AddEventProvider>().getSelectedImagePath();
    if (selectedImagePath != null) {
      setState(() {
        // If the image path is already stored, set it in the UI
      });
    }
  }

  Future<void> requestPermissions() async {
    // Check and request camera and photo permissions
    if (await Permission.camera.isDenied || await Permission.photos.isDenied) {
      PermissionStatus statusCamera = await Permission.camera.request();
      PermissionStatus statusPhotos = await Permission.photos.request();

      if (statusCamera.isGranted || statusPhotos.isGranted) {
        _pickImage();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Permission denied!')),
        );
      }
    } else {
      _pickImage(); // Permissions are already granted, so pick image
    }
  }

  void _handleImagePicker() async {
    await requestPermissions();
    if (await Permission.photos.isGranted) {
      await _pickImage();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permission denied!')),
      );
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        // Save the selected image path in EventProvider
        context.read<AddEventProvider>().setSelectedImagePath(image.path);
      });
      _submitImageData(); // Trigger callback to update the data
    }
  }

  void _submitImageData() {
    if (widget.onImageDataSubmitted != null) {
      widget.onImageDataSubmitted!(
        context.read<AddEventProvider>().getSelectedImagePath(),
        linkController.text.isNotEmpty ? linkController.text : null,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    String? selectedImagePath =
        context.watch<AddEventProvider>().getSelectedImagePath();

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.020),
            // Upload Images Section
            Text(
              'Upload Images',
              style: TextStyle(
                fontFamily: AppFontsFamily.poppins,
                fontSize: AppFontSizes.body,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            GestureDetector(
              onTap: _handleImagePicker, // Trigger image picker logic
              child: CustomPaint(
                size: const Size(200, 200),
                painter: DottedBorderPainter(),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (selectedImagePath == null)
                        Image.asset(
                          "assets/images/camera.png",
                          height: 35,
                          width: 35,
                        )
                      else
                        Image.file(
                          File(selectedImagePath),
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      const Text(
                        "Upload pictures",
                        style: TextStyle(
                          fontSize: AppFontSizes.subtitle1,
                          color: Colors.black,
                          fontFamily: AppFontsFamily.poppins,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Allowed Formats: svg, jpeg, png",
                        style: TextStyle(
                          fontSize: AppFontSizes.subtitle1,
                          color: Colors.black,
                          fontFamily: AppFontsFamily.poppins,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.020),
            // Add Online Link Section
            Text(
              'Add Online Link',
              style: TextStyle(
                fontFamily: AppFontsFamily.poppins,
                fontSize: AppFontSizes.body,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            CustomField(
              controller: linkController,
              hintText: 'www.abc.link',
              hintTextColor: AppColors.IconColors,
              keyboardType: TextInputType.text,
              fillColor: AppColors.textFiledColor,
              prefixIcon: Icon(
                Icons.link,
                color: AppColors.black,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a valid link';
                }
                return null;
              },
              borderColor: AppColors.lighyGreyColor1,
              onChanged: (value) => _submitImageData(), // Update on change
            ),
            SizedBox(height: screenHeight * 0.030),
          ],
        ),
      ),
    );
  }
}
