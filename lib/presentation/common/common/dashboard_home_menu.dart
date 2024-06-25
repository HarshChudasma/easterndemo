import 'package:application/presentation/common/common/home_design_as_per_occution.dart';
import 'package:application/presentation/common/common/home_fabric_material.dart';
import 'package:application/presentation/common/common/home_main_sticky_header.dart';
import 'package:application/presentation/common/common/home_menu_boutique_collection.dart';
import 'package:application/presentation/common/common/home_menu_shopbycate.dart';
import 'package:application/presentation/common/common/home_offer_banner.dart';
import 'package:application/presentation/common/common/home_range_of_pattern.dart';
import 'package:application/presentation/common/common/home_unstiched_menu.dart';
import 'package:application/presentation/common/constants/string_constants.dart';
import 'package:application/presentation/common/utils/progress_indicator.dart';
import 'package:application/presentation/modules/dashboard_screen/dashboard_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashboardHomeMenuWidget extends StatelessWidget {
  DashboardHomeMenuWidget({Key? key}) : super(key: key);

  final DashboardCtrl c = Get.find<DashboardCtrl>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => c.isLoad.value == true
          ? const ProgressIndicatorUtils()
          : c.isError.value == true
              ? const Center(
                  child: Text(StringConstants.somethingWentWrong),
                )
              : c.topRepoModel.value == null || c.middleRepoModel.value == null || c.bottomRepoModel.value == null
                  ? const Center(
                      child: Text(StringConstants.somethingWentWrong),
                    )
                  : ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 100.h,
                              child: MainstickyMenuWidget(),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 16.w),
                              height: 220.h,
                              child: DashboardHomeOfferBannerWidget(),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              StringConstants.shopByCategory,
                              style: context.textTheme.labelLarge?.copyWith(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            DashboardHomeMenuShopByCategoryWidget(),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              StringConstants.shopByfabricMaterial,
                                style: context.textTheme.labelLarge?.copyWith(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700
                                ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            DashboardHomeShopByFabMaterial(),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              StringConstants.unstitched,
                                style: context.textTheme.labelLarge?.copyWith(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700
                                ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            DashboardHomeMenuUnstitchedWidget(
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              StringConstants.boutiqueCollection,
                              style: context.textTheme.labelLarge?.copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            DashboardHomeMenuBoutiqueCollection(),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              StringConstants.rangeOfPattern,
                              style: context.textTheme.labelLarge?.copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            DashboardHomeRangeOfPattern(),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              StringConstants.designAsPerOccasion,
                              style: context.textTheme.labelLarge?.copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            DashboardHomeMenuDesignAsPerOccasion(
                            ),
                          ],
                        )
                      ],
                    ),
    );
  }
}
