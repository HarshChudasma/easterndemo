import 'package:application/app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashCtrl extends GetxController {

  @override
  void onInit() {
    3.delay(() {
      Get.offAllNamed(AppRoutes.dashboardScreen);
    },);
    super.onInit();
  }

}