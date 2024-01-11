import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ko/injector.dart';
import 'package:ko/presentaion/manager/controller/cart/billing_provider.dart';
import 'package:provider/provider.dart';
import 'presentaion/manager/controller/auth/auth_proivder.dart';
import 'presentaion/manager/controller/bottom_nav_provider.dart';
import 'presentaion/manager/controller/cart/cartProvider.dart';
import 'presentaion/manager/controller/dashboard_provider.dart';
import 'presentaion/manager/controller/kotandbot/kot_provider.dart';
import 'presentaion/manager/controller/kotandbot/memeber_provider.dart';
import 'presentaion/routes/app_pages.dart';
import 'presentaion/routes/app_routes.dart';
import 'presentaion/themes/apptheme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Authprovider(sl()),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DashBoardproivder(sl()),
        ),
        ChangeNotifierProvider(
          create: (context) => KotProvider(sl()),
        ),
        ChangeNotifierProvider(
          create: (context) => MemberGuestProvider(sl(), sl(), sl()),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(sl(), sl()),
        ),
        ChangeNotifierProvider(
          create: (context) => BillingProvider(sl()),
        )
      ],
      child: GetMaterialApp(
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.splash,
        getPages: AppRoutes.routes,
      ),
    );
  }
}
