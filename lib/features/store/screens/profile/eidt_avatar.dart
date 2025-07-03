import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/widgets/container/rectangle_container.dart';
import 'package:hapticfone/features/authentication/controllers/image_controller.dart';

import 'package:hapticfone/features/authentication/controllers/user_controller.dart';
import 'package:hapticfone/features/store/screens/profile/circle_image.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';

class EditCircleavatar extends StatelessWidget {
  final Widget? child;
  final String? imageurl;
  final bool isweb;
  const EditCircleavatar({
    super.key,
    this.child,
    this.imageurl = "",
    this.isweb = false,
  });

  @override
  Widget build(BuildContext context) {
    final imagecontroller = Get.put(Imagecontroller());
    final image =
        imagecontroller.imagePaths.isNotEmpty
            ? imagecontroller.selectedImage
            : "assets/24.jpg";
    return Obx(
      () => Column(
        children: [
          kIsWeb
              ? RectangleContainer(
                boxDecoration: BoxDecoration(color: Appcolors.white),
                heigth: 120.h,
                width: 120.w,
                child: Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            imagecontroller.filebytes.value != null
                                ? MemoryImage(imagecontroller.filebytes.value!)
                                : AssetImage("assets/24.jpg") as ImageProvider,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            imagecontroller.pickimage(isweb);
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Appcolors.appbuttongreen,
                            ),
                            child: Icon(
                              Icons.edit,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              : (imagecontroller.imagePaths.isEmpty)
              ? RectangleContainer(
                boxDecoration: BoxDecoration(color: Appcolors.white),
                heigth: 120.h,
                width: 120.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Circleimage(
                          height: 120.h,
                          width: 120.w,
                          image: imageurl,
                          ishaveimage: true,
                        ),
                        Positioned(
                          bottom: 1,
                          child: GestureDetector(
                            onTap: () => imagecontroller.pickimage(isweb),
                            child: Container(
                              height: 40.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Appcolors.appbuttongreen,
                              ),
                              child: Icon(Icons.edit, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
              : RectangleContainer(
                boxDecoration: BoxDecoration(color: Appcolors.white),
                heigth: 120.h,
                width: 120.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Circleimage(
                          height: 120.h,
                          width: 120.w,
                          image: image,
                          isweb: isweb,
                        ),
                        Positioned(
                          bottom: 1,
                          child: GestureDetector(
                            onTap: () {
                              imagecontroller.pickimage(isweb);
                            },
                            child: Container(
                              height: 40.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Appcolors.appbuttongreen,
                              ),
                              child: Icon(Icons.edit, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          SizedBox(height: 10.h),
          Obx(
            () => Text(
              Usercontroller.instance.user.value.fullname,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ),

          Text(imagecontroller.filename.value),
        ],
      ),
    );
  }
}
