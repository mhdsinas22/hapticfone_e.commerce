import 'package:cloudinary_flutter/cloudinary_object.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/bindings/general_bindings.dart';
import 'package:hapticfone/firebase_options.dart';
import 'package:hapticfone/features/authentication/controllers/authentication_repository.dart';
import 'package:hapticfone/features/store/screens/adderss_section/address_controller.dart';
import 'package:hapticfone/splashscreen/splash_screen.dart';

Future<void> main() async {
  // Widgets Binding
  WidgetsFlutterBinding.ensureInitialized();
  CloudinaryObject.fromCloudName(cloudName: "dyliko3a1");
  await dotenv.load(fileName: ".env");
  // await GetStorage.init();
  // // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(Authenticationrepository()));
  // intial the cloudinary context
  // await FirebaseAppCheck.instance.activate(
  //   androidProvider: AndroidProvider.playIntegrity,
  //   appleProvider: AppleProvider.appAttest,
  // );
  Get.lazyPut(() => Addresscontroller());
  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          initialBinding: GeneralBindings(),
          home: Splashscreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    ),
  );
}
