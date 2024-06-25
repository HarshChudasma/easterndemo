import 'package:application/presentation/common/constants/assets_constants.dart';
import 'package:application/presentation/common/constants/string_constants.dart';
import 'package:application/presentation/modules/dashboard_screen/dashboard_ctrl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashboardHomeMenuShopByCategoryWidget extends StatelessWidget {
  DashboardHomeMenuShopByCategoryWidget({
    Key? key,
  }) : super(key: key);

  final DashboardCtrl c = Get.find<DashboardCtrl>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      height: 432.0,
      width: double.infinity,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: c.middleRepoModel.value!.shopByCategory!.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            childAspectRatio: 3 / 2.4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          return SizedBox(
            height: 200.h,
            width: 110.w,
            child: Stack(
              children: [
                SizedBox(
                  height: 200.h,
                  child: CachedNetworkImage(
                    imageUrl: c.middleRepoModel.value!.shopByCategory![index].image!,
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
                      color: HexColor.fromHex(c.middleRepoModel.value!.shopByCategory![index]
                          .tintColor),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            c.middleRepoModel.value!.shopByCategory![index]
                                .name!,
                            style: context.textTheme.labelMedium?.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            StringConstants.explore,
                            style: context.textTheme.labelMedium?.copyWith(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                            ),
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

extension HexColor on Color {

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}