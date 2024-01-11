import 'package:flutter/material.dart';
import 'package:ko/presentaion/manager/controller/bottom_nav_provider.dart';
import 'package:ko/presentaion/manager/controller/cart/cartProvider.dart';
import 'package:provider/provider.dart';
import '../themes/appcolors.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    final bottomNavController = Provider.of<BottomNavProvider>(context);
    final cartprovider = Provider.of<CartProvider>(context);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Consumer<BottomNavProvider>(
          builder: (context, value, child) => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: AppColors.black,
            selectedItemColor: AppColors.maincolor,
            showUnselectedLabels: true,
            unselectedLabelStyle: const TextStyle(color: AppColors.black),
            items: [
              const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.info_outlined), label: "Pending Bills"),
              BottomNavigationBarItem(
                  icon: Stack(
                    children: [
                      const Icon(
                        Icons.shopping_cart_outlined,
                      ),
                      Positioned(
                          right: 0,
                          child: Consumer<CartProvider>(
                            builder: (context, value, child) {
                              if (cartprovider.cartItemList.isEmpty) {
                                return const SizedBox.shrink();
                              } else {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.red,
                                      borderRadius: BorderRadius.circular(6)),
                                  constraints: const BoxConstraints(
                                    minHeight: 12,
                                    minWidth: 12,
                                  ),
                                  child: Text(
                                    "${cartprovider.cartItemList.length}",
                                    style: const TextStyle(
                                        color: AppColors.white, fontSize: 8),
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              }
                            },
                          ))
                    ],
                  ),
                  label: "cart"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.logout), label: "Logout"),
            ],
            currentIndex: bottomNavController.selectedIndex,
            onTap: bottomNavController.onItemTapped,
          ),
        ),
        body: Consumer<BottomNavProvider>(
          builder: (context, value, child) => Center(
            child:
                bottomNavController.bodys[(bottomNavController.selectedIndex)],
          ),
        ),
      ),
    );
  }
}
