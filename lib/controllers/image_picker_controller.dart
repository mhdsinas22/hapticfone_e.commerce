import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  static ImagePickerController get instance => Get.find();
  var pickedImage = Rx<File?>(null); // observable image variable

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
    }
  }
}
