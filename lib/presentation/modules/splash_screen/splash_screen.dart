import 'package:application/presentation/common/constants/assets_constants.dart';
import 'package:application/presentation/common/constants/string_constants.dart';
import 'package:application/presentation/modules/splash_screen/splash_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashCtrl c = Get.put(SplashCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                StringConstants.curate,
                style: context.textTheme.labelLarge?.copyWith(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
