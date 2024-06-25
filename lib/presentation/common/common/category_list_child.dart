import 'package:application/data/model/category_repo_model.dart';
import 'package:application/presentation/common/constants/assets_constants.dart';
import 'package:application/presentation/common/constants/color_constants.dart';
import 'package:application/presentation/modules/dashboard_screen/dashboard_ctrl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryListChild extends StatelessWidget {
  final Child categoryListModel;
  CategoryListChild({Key? key,required this.categoryListModel}) : super(key: key);

  final DashboardCtrl c = Get.find<DashboardCtrl>();

  @override
  Widget build(BuildContext context) {
    return
      Container(
      height: 120.h,
      margin: EdgeInsets.only(bottom: 4.w),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: c.categoryRepoModel.value!.bannerImage!,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Image.asset(ImageConstants.IMAGE_ERROR),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  categoryListModel.categoryName,
                  style: context.textTheme.labelLarge?.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
