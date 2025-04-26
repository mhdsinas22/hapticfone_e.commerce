import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapticfone/signup/signupcontoller.dart';
import 'package:hapticfone/termsandcondtions/termsandcondtions.dart';
import 'package:hapticfone/utils/validators/validator.dart';

class Signupform extends StatelessWidget {
  const Signupform({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Signupcontoller());
    return Form(
      key: controller.signupform,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 30),
              Text(
                "Full Name",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 5),
          SizedBox(
            width: 322,
            child: TextFormField(
              controller: controller.fullname,
              validator:
                  (value) => Validator.validateEmptyText("Full Name", value),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 216, 246, 180),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              SizedBox(width: 30),
              Text(
                "Email",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 5),

          SizedBox(
            width: 322,
            child: TextFormField(
              controller: controller.email,
              validator: (value) => Validator.validateEmail(value),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 216, 246, 180),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 30),
              Text(
                "PhoneNumber",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 5),
          SizedBox(
            width: 322,
            child: TextFormField(
              controller: controller.phonenumber,
              validator: (value) => Validator.validatePhoneNumber(value),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 216, 246, 180),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 30),
              Text(
                "Password",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 5),
          SizedBox(
            width: 322,
            child: Obx(
              () => TextFormField(
                obscureText: controller.hidepassword.value,
                controller: controller.password,
                validator: (value) => Validator.validatePassword(value),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed:
                        () =>
                            controller.hidepassword.value =
                                !controller.hidepassword.value,
                    icon: Icon(
                      // ignore: unrelated_type_equality_checks
                      controller.hidepassword == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 216, 246, 180),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Termsandcondtions()],
          ),
          SizedBox(height: 21),

          SizedBox(
            width: 333,
            child: ElevatedButton(
              onPressed: () {
                controller.signup();
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Color.fromARGB(255, 188, 234, 114),
                ),
              ),
              child: Text("Sign Up", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
