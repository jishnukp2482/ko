import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ko/presentaion/manager/controller/cart/cartProvider.dart';
import 'package:ko/presentaion/manager/controller/kotandbot/kot_provider.dart';
import 'package:ko/presentaion/manager/controller/kotandbot/memeber_provider.dart';
import 'package:provider/provider.dart';

import '../../routes/app_pages.dart';
import '../../themes/appcolors.dart';
import '../../widgets/kot/main_category_Menu.dart';
import '../../widgets/kot/sub_category_Menu.dart';

class KotPage extends StatefulWidget {
  const KotPage({super.key});

  @override
  State<KotPage> createState() => _KotPageState();
}

class _KotPageState extends State<KotPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final kotController = Provider.of<KotProvider>(context);
    final guestcontroller = Provider.of<MemberGuestProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        setState(() {
          kotController.selectedMainGroup = "LIQUOR";
          kotController.selectedSubgroup = "";
          kotController.selectedMainCategoryIndex = 0;
          guestcontroller.isMemberSelected = false;
          guestcontroller.isGuestSelected = false;
          guestcontroller.nameCntlr = "";
          guestcontroller.tablecontroller.clear();
          guestcontroller.remarkcontroller.clear();
          guestcontroller.waiterNameController = "";
          guestcontroller.balanceCntlr = "";
          guestcontroller.biocardNoTexteditingCntlr.clear();
          guestcontroller.isGuestSelected = false;
          guestcontroller.isMemberSelected = false;
          guestcontroller.memberNoTextedTexteditingCntlr.clear();
          guestcontroller.nameCntlr = "";
          guestcontroller.tablecontroller.clear();
          guestcontroller.remarkcontroller.clear();
          guestcontroller.counterList.clear();
          guestcontroller.waiterList.clear();
          guestcontroller.remarkcontroller.clear();
          guestcontroller.waiterNameController = "";
        });

        Get.offAllNamed(AppPages.bottomnav);
        return Future.value(true);
      },
      child: SafeArea(
          child: Scaffold(
        backgroundColor: AppColors.backgroundcolor,
        appBar: AppBar(
            toolbarHeight: kToolbarHeight + height * 0.15,
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
            leading: IconButton(
                onPressed: () {
                  debugPrint("============back press print started===========");
                  setState(() {
                    kotController.selectedMainGroup = "LIQUOR";
                    kotController.selectedSubgroup = "";
                    kotController.selectedMainCategoryIndex = 0;
                    guestcontroller.balanceCntlr = "";
                    guestcontroller.nameCntlr = "";
                    guestcontroller.isMemberSelected = false;
                    guestcontroller.isGuestSelected = false;
                    guestcontroller.tablecontroller.clear();
                    guestcontroller.remarkcontroller.clear();
                    guestcontroller.waiterNameController = "";
                    guestcontroller.balanceCntlr = "";
                    guestcontroller.biocardNoTexteditingCntlr.clear();
                    guestcontroller.isGuestSelected = false;
                    guestcontroller.isMemberSelected = false;
                    guestcontroller.memberNoTextedTexteditingCntlr.clear();
                    guestcontroller.nameCntlr = "";
                    guestcontroller.tablecontroller.clear();
                    guestcontroller.remarkcontroller.clear();
                    guestcontroller.counterList.clear();
                    guestcontroller.waiterList.clear();
                    guestcontroller.remarkcontroller.clear();
                    guestcontroller.waiterNameController = "";
                  });

                  debugPrint("isItemLoading ${kotController.isItemLoading}");
                  debugPrint(
                      "issubItemLoading ${kotController.issubItemLoading}");
                  debugPrint(
                      "selectedMainCategoryIndex ${kotController.selectedMainCategoryIndex}");
                  debugPrint(
                      "selectedMainID ${kotController.selectedMainGroup}");
                  debugPrint(
                      "selectedSubCategoryIndex ${kotController.selectedSubCategoryIndex}");
                  debugPrint("selectedSubID ${kotController.selectedSubgroup}");
                  debugPrint(
                      "selectedSubItem ${kotController.selectedSubItem}");
                  debugPrint(
                      "selectedSubItem ${kotController.selectedSubItem}");
                  debugPrint("isItemLoading ${kotController.isItemLoading}");
                  debugPrint(
                      "isSelectedMainLoading ${kotController.isSelectedMainLoading}");
                  debugPrint("============back press print ended===========");
                  Get.offAllNamed(AppPages.bottomnav);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.white,
                )),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                        child: Text(
                      "Name",
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500),
                    )),
                    const Expanded(
                        child: Center(
                            child: Text(
                      ":",
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500),
                    ))),
                    Expanded(
                        child: Text(
                      guestcontroller.nameCntlr,
                      style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500),
                    ))
                  ],
                ),
                Row(
                  children: [
                    const Expanded(
                        child: Text(
                      "Type",
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500),
                    )),
                    const Expanded(
                        child: Center(
                            child: Text(
                      ":",
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500),
                    ))),
                    Expanded(
                        child: Text(
                      guestcontroller.memeberOrGuestcontroller,
                      style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500),
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      guestcontroller.memeberOrGuestcontroller == "Member"
                          ? "Member No"
                          : "Bio card No",
                      style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500),
                    )),
                    const Expanded(
                        child: Center(
                            child: Text(
                      ":",
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500),
                    ))),
                    Expanded(
                        child: SizedBox(
                      // color: AppColors.green,
                      width: width * 0.03,
                      child: Text(
                        guestcontroller.memeberOrGuestcontroller == "Member"
                            ? guestcontroller
                                .memberNoTextedTexteditingCntlr.text
                            : guestcontroller.biocardNoTexteditingCntlr.text,
                        style: const TextStyle(
                            fontSize: 15,
                            color: AppColors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
                  ],
                ),
                guestcontroller.biocardNoTexteditingCntlr.text.isNotEmpty
                    ? Row(
                        children: [
                          const Expanded(
                              child: Text(
                            "Member No",
                            style: TextStyle(
                                fontSize: 15,
                                color: AppColors.white,
                                fontWeight: FontWeight.w500),
                          )),
                          const Expanded(
                              child: Center(
                                  child: Text(
                            ":",
                            style: TextStyle(
                                fontSize: 15,
                                color: AppColors.white,
                                fontWeight: FontWeight.w500),
                          ))),
                          Expanded(
                              child: Text(
                            guestcontroller.memberNoTextedTexteditingCntlr.text,
                            style: const TextStyle(
                                fontSize: 15,
                                color: AppColors.white,
                                fontWeight: FontWeight.w500),
                          )),
                        ],
                      )
                    : SizedBox.shrink(),
                Row(
                  children: [
                    const Expanded(
                        child: Text(
                      "waiter ",
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500),
                    )),
                    const Expanded(
                        child: Center(
                            child: Text(
                      ":",
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500),
                    ))),
                    Expanded(
                        child: Text(
                      guestcontroller.waiterNameController,
                      style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500),
                    )),
                  ],
                ),
                Row(
                  children: [
                    const Expanded(
                        child: Text(
                      "Table",
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500),
                    )),
                    const Expanded(
                        child: Center(
                            child: Text(
                      ":",
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500),
                    ))),
                    Expanded(
                        child: Text(
                      guestcontroller.tablecontroller.text,
                      style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500),
                    )),
                  ],
                ),
                Row(
                  children: [
                    const Expanded(
                        child: Text(
                      "Balance",
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500),
                    )),
                    const Expanded(
                        child: Center(
                            child: Text(
                      ":",
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500),
                    ))),
                    Expanded(
                        child: Text(
                      guestcontroller.balanceCntlr,
                      style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500),
                    )),
                  ],
                ),
              ],
            )),
        body: ListView(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            const MainCategoryMenu(),
            SizedBox(
              height: height * 0.02,
            ),
            const SubCategoryWidget(),
          ],
        ),
        bottomNavigationBar: Consumer<CartProvider>(
          builder: (context, value, child) => cartProvider.cartItemList.isEmpty
              ? SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 50,
                    width: width,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppPages.cartpage);
                      },
                      child: Text("Place Order"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.red,
                          foregroundColor: AppColors.white),
                    ),
                  ),
                ),
        ),
      )),
    );
  }
}
