import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hapticfone/utils/constants/keys.dart';
import 'package:http/http.dart' as http;

class Imagecontroller extends GetxController {
  static Imagecontroller get instance => Get.find();
  RxString cloudinaryurl = "".obs;
  RxList<String> imagePaths = <String>[].obs;
  List<PlatformFile>? selectedImage;
  Rx<Uint8List?> filebytes = Rx<Uint8List?>(null);
  RxString filename = "".obs;
  void pickimage(bool isweb) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: kIsWeb,
    );
    if (result != null) {
      if (kIsWeb) {
        filebytes.value = result.files.first.bytes;
        filename.value = result.files.first.name;
      } else {
        print("WORKING");
        final paths = result.files.map((file) => file.path!).toList();
        imagePaths.assignAll(paths);
        selectedImage = result.files;
        print("ARRY:$paths");
        print("imagepath:-$selectedImage");
      }
    } else {
      print("NO IMAGE SELECTED or INVALID BYTES");
    }
  }

  // Future<void> uploadcloudinaryaimage() async {
  //   try {
  //     if (selectedImage == null) {
  //       return;
  //     }
  //     final imagepath = selectedImage!.first.path;
  //     const cloudname = Keys.cloudname;
  //     const cloudprest = Keys.uploadpreset;
  //     final url = Uri.parse(
  //       "https://api.cloudinary.com/v1_1/$cloudname/image/upload",
  //     );
  //     final request = http.MultipartRequest("POST", url);
  //     request.fields["upload_preset"] = cloudprest;
  //     // ..files.add(await http.MultipartFile.fromPath("file", imagepath!));
  //     if (kIsWeb) {
  //       request.files.add(
  //         http.MultipartFile.fromBytes(
  //           "file",
  //           filebytes.value!,
  //           filename: filename.value,
  //         ),
  //       );
  //     } else {
  //       request.files.add(
  //         await http.MultipartFile.fromPath("file", imagepath!),
  //       );
  //     }

  //     final response = await request.send();
  //     if (response.statusCode == 200) {
  //       final responsedata = await http.Response.fromStream(response);
  //       final data = jsonDecode(responsedata.body);
  //       cloudinaryurl.value = data["secure_url"];
  //       print("SUCESS$data");
  //     } else {
  //       print("ERROR$e");
  //     }
  //   } catch (e) {
  //     print("❌ Exception occurred: $e");
  //   }
  // }
  Future<void> uploadcloudinaryaimage() async {
    try {
      // If it's web and no file is selected
      if (kIsWeb && filebytes.value == null) return;

      // If it's mobile and no image is selected
      if (!kIsWeb && selectedImage == null) return;

      final imagepath = !kIsWeb ? selectedImage!.first.path : null;
      const cloudname = Keys.cloudname;
      const cloudprest = Keys.uploadpreset;

      final url = Uri.parse(
        "https://api.cloudinary.com/v1_1/$cloudname/image/upload",
      );
      final request = http.MultipartRequest("POST", url);
      request.fields["upload_preset"] = cloudprest;

      if (kIsWeb) {
        // For web: using filebytes and filename
        request.files.add(
          http.MultipartFile.fromBytes(
            "file",
            filebytes.value!,
            filename: filename.value,
          ),
        );
      } else {
        // For mobile: using file path
        request.files.add(
          await http.MultipartFile.fromPath("file", imagepath!),
        );
      }

      final response = await request.send();
      if (response.statusCode == 200) {
        final responsedata = await http.Response.fromStream(response);
        final data = jsonDecode(responsedata.body);
        cloudinaryurl.value = data["secure_url"];
        print("✅ Success: $data");
      } else {
        print("❌ Upload failed with status: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ Exception occurred: $e");
    }
  }
}
