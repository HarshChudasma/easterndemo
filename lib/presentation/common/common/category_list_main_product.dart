import 'package:application/presentation/common/common/category_list_child.dart';
import 'package:application/presentation/common/constants/assets_constants.dart';
import 'package:application/presentation/common/constants/color_constants.dart';
import 'package:application/presentation/modules/dashboard_screen/dashboard_ctrl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryListMainProduct extends StatelessWidget {
  final int index;
  late RxBool isExpanded = false.obs;
  CategoryListMainProduct({Key? key,required this.index}) : super(key: key);

  final DashboardCtrl c= Get.find<DashboardCtrl>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            isExpanded.value = !isExpanded.value;
          },
          child: Container(
            height: 120.h,
            margin: EdgeInsets.only(bottom: 8.w),
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: c
                        .categoryRepoModel.value!.bannerImage!,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        Image.asset(ImageConstants.IMAGE_ERROR),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          c.categoryRepoModel
                              .value!.categories![index].categoryName,
                          style: context.textTheme.labelLarge?.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor
                          ),
                        ),
                        Obx(
                              () => Image.asset(
                            isExpanded.value == true
                                ? ImageConstants.DOWN_ARROW
                                : ImageConstants.RIGHT_ARROW,
                            height: 24.h,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ...c
            .categoryRepoModel.value!.categories![index].child!
            .map(
              (element) {
            return Obx(
                  () => isExpanded.value == true
                  ? CategoryListChild(
                categoryListModel: element,
              )
                  : const SizedBox(),
            );
          },
        ).toList(),
      ],
    );
  }



}
