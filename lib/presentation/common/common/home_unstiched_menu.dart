import 'package:application/presentation/common/constants/assets_constants.dart';
import 'package:application/presentation/common/constants/color_constants.dart';
import 'package:application/presentation/modules/dashboard_screen/dashboard_ctrl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashboardHomeMenuUnstitchedWidget extends StatelessWidget {
  DashboardHomeMenuUnstitchedWidget({
    Key? key,
  }) : super(key: key);

  final DashboardCtrl c = Get.find<DashboardCtrl>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.h,
      child: CarouselSlider.builder(
        itemCount: c.middleRepoModel.value!.unstitched!.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          return Stack(
            children: [
              SizedBox(
                height: 320.h,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl:
                      c.middleRepoModel.value!.unstitched![itemIndex].image!,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) =>
                      Image.asset(ImageConstants.IMAGE_ERROR),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.6),
                  alignment: Alignment.center,
                  child: Text(
                    c.middleRepoModel.value!.unstitched![itemIndex].name!,
                    style: context.textTheme.labelLarge?.copyWith(
                        fontSize: 24.sp, fontWeight: FontWeight.bold,color: AppColors.whiteColor),
                  ),
                ),
              ),
            ],
          );
        },
        options: CarouselOptions(
          height: 400.h,
          aspectRatio: 18 / 9,
          viewportFraction: 0.60,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
