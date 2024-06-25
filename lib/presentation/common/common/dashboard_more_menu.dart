import 'package:application/presentation/common/constants/assets_constants.dart';
import 'package:application/presentation/common/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';

class DashboardMoreMenuWidget extends StatelessWidget {
  const DashboardMoreMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          ImageConstants.MORE_ICON,
          height: 80.h,
        ),
        SizedBox(
          height: 16.h,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            StringConstants.more,
            style: context.textTheme.labelLarge?.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],
    );
  }
}
