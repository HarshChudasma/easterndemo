import 'package:application/presentation/common/constants/string_constants.dart';
import 'package:application/presentation/modules/dashboard_screen/dashboard_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  final DashboardCtrl c = Get.put(DashboardCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          StringConstants.curate,
          style: context.textTheme.labelLarge?.copyWith(
            fontSize: 24.sp
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 24.h,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_bag,
              size: 24.h,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Obx(
                  () => c.currentPage),
        ),
      ),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          currentIndex: c.bottomBarItemCurrentIndex(),
          onTap: (int index) {
            c.bottomBarItemCurrentIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              label: StringConstants.home,
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: StringConstants.category,
              icon: Icon(Icons.category),
            ),
            BottomNavigationBarItem(
              label: StringConstants.share,
              icon: Icon(Icons.share),
            ),
            BottomNavigationBarItem(
              label: StringConstants.sale,
              icon: Icon(Icons.shopping_bag),
            ),
            BottomNavigationBarItem(
              label: StringConstants.more,
              icon: Icon(Icons.more),
            ),
          ],
        ),
      ),
    );
  }
}
