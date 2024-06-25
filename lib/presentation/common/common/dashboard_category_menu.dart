import 'package:application/presentation/common/common/category_list_main_product.dart';
import 'package:application/presentation/common/constants/string_constants.dart';
import 'package:application/presentation/common/utils/progress_indicator.dart';
import 'package:application/presentation/modules/dashboard_screen/dashboard_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardCategoryMenuWidget extends StatelessWidget {
  DashboardCategoryMenuWidget({Key? key}) : super(key: key);

  final DashboardCtrl c = Get.find<DashboardCtrl>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => c.isCateLoad.value == true
          ? const ProgressIndicatorUtils()
          : c.isCateError.value == true
              ? const Center(
                  child: Text(StringConstants.somethingWentWrong),
                )
              : c.categoryRepoModel.value == null
                  ? const Center(
                      child: Text(StringConstants.somethingWentWrong),
                    )
                  : ListView.builder(
                      itemCount: c.categoryRepoModel.value!.categories!.length,
                      itemBuilder: (context, index) {
                        return CategoryListMainProduct(
                          index: index,
                        );
                      },
                    ),
    );
  }
}
