import 'package:application/presentation/common/constants/assets_constants.dart';
import 'package:application/presentation/common/constants/color_constants.dart';
import 'package:application/presentation/common/constants/string_constants.dart';
import 'package:application/presentation/modules/dashboard_screen/dashboard_ctrl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashboardHomeMenuBoutiqueCollection extends StatelessWidget {
  late RxInt crousalSliderPageIndex = 0.obs;
  DashboardHomeMenuBoutiqueCollection({
    Key? key,
  }) : super(key: key);

  final DashboardCtrl c = Get.find<DashboardCtrl>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider.builder(
          itemCount: c.middleRepoModel.value?.boutiqueCollection!.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) => Stack(
            children: [
              SizedBox(
                height: 320.h,
                child: CachedNetworkImage(
                  imageUrl: c.middleRepoModel.value!
                      .boutiqueCollection![itemIndex]
                      .bannerImage!,
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
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.w, vertical: 20.h),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.75),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          StringConstants.handpicked,
                          style: context.textTheme.labelLarge?.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                              color: AppColors.whiteColor
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          StringConstants.explore,
                          style: context.textTheme.labelMedium?.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                              color: AppColors.whiteColor
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          options: CarouselOptions(
            onPageChanged: (int pageIndex, changePage) {
              crousalSliderPageIndex.value = pageIndex;
            },
            height: 320.h,
            aspectRatio: 18 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            // onPageChanged: callbackFunction,
            scrollDirection: Axis.horizontal,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: c.middleRepoModel.value!.boutiqueCollection!
              .map(
                (element) {
              //these two lines
              int index = c.middleRepoModel.value!.boutiqueCollection!
                  .indexOf(element); //are changed
              return Obx(() => Container(
                width: 10.w,
                height: 10.w,
                margin: EdgeInsets.symmetric(
                    vertical: 10.h, horizontal: 4.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: crousalSliderPageIndex.value == index
                      ? const Color.fromRGBO(0, 0, 0, 0.9)
                      : const Color.fromRGBO(0, 0, 0, 0.4),
                ),
              ));
            },
          ).toList(),
        ),
      ],
    );
  }
}