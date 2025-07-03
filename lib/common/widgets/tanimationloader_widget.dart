import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class Tanimationloaderwidget extends StatelessWidget {
  const Tanimationloaderwidget({
    super.key,
    required this.text,
    required this.animation,
    this.showaction = false,
    this.actionText,
    this.onactionPressed,
    this.isweb = false,
  });
  final bool isweb;
  final String text;
  final String animation;
  final bool showaction;
  final String? actionText;
  final VoidCallback? onactionPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              animation,
              width: isweb ? 100.w : MediaQuery.of(context).size.width * 0.8,
            ),
            SizedBox(height: 10.h),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            showaction
                ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onactionPressed,
                    child: Text(
                      actionText!,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.apply(color: Colors.green),
                    ),
                  ),
                )
                : SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
