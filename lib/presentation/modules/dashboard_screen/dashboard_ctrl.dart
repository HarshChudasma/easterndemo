import 'package:application/data/irepositiories/dashboard_repo_impl.dart';
import 'package:application/data/model/bottom_repo_model.dart';
import 'package:application/data/model/category_repo_model.dart';
import 'package:application/data/model/middle_repo_model.dart';
import 'package:application/data/model/top_repo_model.dart';
import 'package:application/domain/repositiories/dashboard_repo.dart';
import 'package:application/presentation/common/common/dashboard_category_menu.dart';
import 'package:application/presentation/common/common/dashboard_home_menu.dart';
import 'package:application/presentation/common/common/dashboard_more_menu.dart';
import 'package:application/presentation/common/common/dashboard_sale_menu.dart';
import 'package:application/presentation/common/common/dashboard_share_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardCtrl extends GetxController {

  RxInt bottomBarItemCurrentIndex = 0.obs;
  DashboardRepository dashboardRepository = DashboardRepoImpl();
  RxBool isLoad = false.obs;
  RxBool isError = false.obs;

  RxBool isCateLoad = false.obs;
  RxBool isCateError = false.obs;

  Rxn<CategoryRepositoryModel> categoryRepoModel = Rxn<CategoryRepositoryModel>();
  Rxn<TopRepositoryModel> topRepoModel = Rxn<TopRepositoryModel>();
  Rxn<MiddleRepositoryModel> middleRepoModel = Rxn<MiddleRepositoryModel>();
  Rxn<BottomRepositoryModel> bottomRepoModel = Rxn<BottomRepositoryModel>();

  Widget get currentPage {
    switch (bottomBarItemCurrentIndex()) {
      case 0:
        return DashboardHomeMenuWidget();
      case 1:
        return DashboardCategoryMenuWidget();
      case 2:
        return const DashboardShareMenuWidget();
      case 3:
        return const DashboardSaleMenuWidget();
      case 4:
        return const DashboardMoreMenuWidget();
    }
    return const SizedBox();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() async {
    isLoad(true);
    await getAllCategoryApiCall();
    await getAllDashboardMenuTopApiCall();
  }

  // get top menu api call
  getAllCategoryApiCall() async {
    try {
      isCateLoad(true);
      categoryRepoModel.value =
      await dashboardRepository.categoryGetApiCall();
      if (categoryRepoModel.value != null) {
        isCateLoad(false);
        return;
      }
    } catch (error) {
      isCateLoad(false);
      isCateError(true);
    }
  }

  // get top menu api call
  getAllDashboardMenuTopApiCall() async {
    try {
      isLoad(true);
      topRepoModel.value = await dashboardRepository.topRepoGetApiCall();
      if (topRepoModel.value != null) {
        getAllDashboardMenuMiddleApiCall();
      }
    } catch (error) {
      isLoad(false);
      isError(true);
    }
  }

  // get middle menu api call
  getAllDashboardMenuMiddleApiCall() async {
    try {
      middleRepoModel.value =
      await dashboardRepository.middleRepoGetApiCall();
      if (middleRepoModel.value != null) {
        getAllDashboardMenuBottomApiCall();
      }
    } catch (error) {
      isLoad(false);
      isError(true);
    }
  }

  // get bottom menu api call
  getAllDashboardMenuBottomApiCall() async {
    try {
      bottomRepoModel.value =
      await dashboardRepository.bottomRepoGetApiCall();
      if (bottomRepoModel.value != null) {
        isLoad(false);
      }
    } catch (error) {
      isLoad(false);
      isError(true);
    }
  }



}