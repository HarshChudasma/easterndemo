import 'package:application/presentation/common/constants/assets_constants.dart';
import 'package:application/presentation/modules/dashboard_screen/dashboard_ctrl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashboardHomeShopByFabMaterial extends StatelessWidget {
  DashboardHomeShopByFabMaterial({
    Key? key,
  }) : super(key: key);

  final DashboardCtrl c = Get.find<DashboardCtrl>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      height: 240.h,
      width: double.infinity,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: c.middleRepoModel.value!.shopByFabric!.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          return SizedBox(
            height: 60.h,
            width: 60.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: Stack(
                children: [
                  SizedBox(
                    height: 72.h,
                    width: Get.width,
                    child: CachedNetworkImage(
                      imageUrl: c.middleRepoModel.value!.shopByFabric![index]
                          .image!,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) =>
                          Image.asset(ImageConstants.IMAGE_ERROR),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                        ),
                        child: Text(
                          c.middleRepoModel.value!.shopByFabric![index]
                              .name,
                          textAlign: TextAlign.center,
                          style: context.textTheme.labelSmall?.copyWith(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}