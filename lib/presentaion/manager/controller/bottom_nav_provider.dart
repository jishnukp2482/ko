import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ko/presentaion/pages/billing/billing.dart';
import 'package:ko/presentaion/pages/cart/cartpage.dart';
import 'package:ko/presentaion/routes/app_pages.dart';
import '../../pages/dashboard/dashboard.dart';

class BottomNavProvider extends ChangeNotifier {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    if (index == 3) {
      Get.offAllNamed(AppPages.loginpage);
    }
    selectedIndex = index;
    notifyListeners();
  }

  final List bodys = [
    const DashboardScreen(),
    Billingpage(),
    const CartPage(),
    const Card(
      child: Padding(
        padding: EdgeInsets.all(50),
        child: Text("logout"),
      ),
    ),
  ];
}
