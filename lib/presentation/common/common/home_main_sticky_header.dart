import 'package:application/presentation/common/constants/assets_constants.dart';
import 'package:application/presentation/modules/dashboard_screen/dashboard_ctrl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainstickyMenuWidget extends StatelessWidget {
  MainstickyMenuWidget(
      {Key? key})
      : super(key: key);

  final DashboardCtrl c = Get.find<DashboardCtrl>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: c
          .topRepoModel.value?.mainStickyMenu!.length,
      itemBuilder: (context, index) {
        return Container(
          height: 90.h,
          width: 120.w,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(color: Colors.grey),
            ],
            borderRadius: BorderRadius.circular(4.r),
          ),
          margin: EdgeInsets.only(right: 8.w),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                  child:
                  CachedNetworkImage(
                    imageUrl: c.topRepoModel.value!.mainStickyMenu![index].image,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        Image.asset(ImageConstants.IMAGE_ERROR),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 20.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4.r),
                      bottomRight: Radius.circular(4.r),
                    ),
                    color: Colors.white,
                  ),
                  child: Text(
                    c.topRepoModel.value!
                        .mainStickyMenu![index].title!,
                    style: context.textTheme.labelSmall?.copyWith(fontSize: 10.sp,fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}