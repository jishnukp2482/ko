import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ko/core/respose_classify.dart';
import 'package:ko/presentaion/manager/controller/auth/auth_proivder.dart';
import 'package:ko/presentaion/routes/LocalStoragename.dart';
import 'package:ko/presentaion/widgets/dashboard/dashboard_Menu_tab.dart';
import 'package:provider/provider.dart';

import '../../themes/appcolors.dart';
import '../../widgets/dashboard/carousel_menu.dart';
import '../../widgets/dashboard/dashboard_menu.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final authProvider = Provider.of<Authprovider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundcolor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    AppColors.maincolor,
                    AppColors.maincolor2,
                    AppColors.maincolor3,
                    AppColors.maincolor4,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  tileMode: TileMode.mirror),
            ),
          ),
          elevation: 0,
          toolbarHeight: kToolbarHeight + height * 0.09,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Club",
                    style: GoogleFonts.lora(
                      textStyle: const TextStyle(
                          fontSize: 28,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: height * 0.02,
                    backgroundColor: AppColors.white,
                    child: const Icon(
                      Icons.person,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer<Authprovider>(
                    builder: (context, value, child) =>
                        authProvider.loginstate.status == Status.LOADING
                            ? const SizedBox(
                                height: 5,
                                width: 5,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.white,
                                    strokeWidth: 1,
                                  ),
                                ),
                              )
                            : Text(
                                authProvider.box
                                        .read(LocalStorageNames.usernameKEY) ??
                                    "Name",
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "kozhikode",
                        style: TextStyle(color: AppColors.white, fontSize: 15),
                      ),
                      Icon(
                        Icons.location_on_outlined,
                        color: AppColors.white,
                        size: 18,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: ListView(
            // padding: const EdgeInsets.all(10.0),
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              const CarouselMenu(),
              SizedBox(
                height: height * 0.08,
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    return DashboardMenuTab();
                  } else {
                    return DashboardMenu();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
