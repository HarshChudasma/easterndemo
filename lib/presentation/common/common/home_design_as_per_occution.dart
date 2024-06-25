import 'package:application/presentation/common/constants/assets_constants.dart';
import 'package:application/presentation/modules/dashboard_screen/dashboard_ctrl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashboardHomeMenuDesignAsPerOccasion extends StatelessWidget {
  DashboardHomeMenuDesignAsPerOccasion(
      {Key? key})
      : super(key: key);

  final DashboardCtrl c = Get.find<DashboardCtrl>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      height: 432.h,
      width: double.infinity,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: c.bottomRepoModel.value!.designOccasion!.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            childAspectRatio: 3 / 2.4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          return SizedBox(
            height: 160.h,
            width: 160.w,
            child: Stack(
              children: [
                SizedBox(
                  height: 200.h,
                  width: Get.width,
                  child:
                  CachedNetworkImage(
                    imageUrl: c.bottomRepoModel.value!.designOccasion![index].image!,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        Image.asset(ImageConstants.IMAGE_ERROR),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.infinity,
                      height: 60.h,
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            c.bottomRepoModel.value!.designOccasion![index]
                                .name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.labelMedium!.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                c.bottomRepoModel.value!.designOccasion![index]
                                    .subName!,
                                style: context.textTheme.labelSmall?.copyWith(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              const Spacer(),
                              Text(
                                c.bottomRepoModel.value!.designOccasion![index]
                                    .cta!,
                                style: context.textTheme.labelSmall?.copyWith(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}