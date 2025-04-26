import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hapticfone/signup/signupcontoller.dart';

class Termsandcondtions extends StatelessWidget {
  const Termsandcondtions({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Signupcontoller.instance;
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.pricayandpolicy.value,
              onChanged:
                  (value) =>
                      controller.pricayandpolicy.value =
                          !controller.pricayandpolicy.value,
            ),
          ),
        ),
        SizedBox(width: 10),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "I agreeTo",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: "Privaypolicy",
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black,
                ),
              ),
              TextSpan(
                text: "and",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: "Terms and Condtions",
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
