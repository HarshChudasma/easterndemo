import 'package:application/presentation/common/constants/assets_constants.dart';
import 'package:application/presentation/common/constants/color_constants.dart';
import 'package:application/presentation/common/constants/string_constants.dart';
import 'package:application/presentation/modules/dashboard_screen/dashboard_ctrl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:math';

class DashboardHomeOfferBannerWidget extends StatelessWidget {
  DashboardHomeOfferBannerWidget({
    Key? key,
  }) : super(key: key);

  final DashboardCtrl c = Get.find<DashboardCtrl>();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.r),
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    width: Get.width,
                    child: CachedNetworkImage(
                      imageUrl: "https://picsum.photos/536/365",
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) =>
                          Image.asset(ImageConstants.IMAGE_ERROR),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: Get.width,
                    color: AppColors.secondaryColor,
                  )
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                color: Colors.white,
                width: Get.width,
                margin: EdgeInsets.symmetric(horizontal: 32.w),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                child: Text(
                  StringConstants.notAllFashion,
                  style: context.textTheme.labelLarge
                      ?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
      options: CarouselOptions(
        height: 400.h,
        aspectRatio: 18 / 9,
        viewportFraction: 0.84,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        // onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
