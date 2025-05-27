import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/bindings/general_bindings.dart';
import 'package:hapticfone/firebase_options.dart';
import 'package:hapticfone/repository/authenticationrepository.dart';
import 'package:hapticfone/screens/adderss_section/address_controller.dart';
import 'package:hapticfone/splashscreen/splashscreen.dart';

Future<void> main() async {
  // Widgets Binding
  WidgetsFlutterBinding.ensureInitialized();
  // init Local Stroage
  // await GetStorage.init();
  // // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(Authenticationrepository()));
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
