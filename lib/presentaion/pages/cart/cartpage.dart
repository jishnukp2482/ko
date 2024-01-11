import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ko/presentaion/manager/controller/bottom_nav_provider.dart';
import 'package:ko/presentaion/manager/controller/cart/cartProvider.dart';
import 'package:ko/presentaion/manager/controller/kotandbot/memeber_provider.dart';
import 'package:ko/presentaion/routes/LocalStoragename.dart';
import 'package:ko/presentaion/themes/appcolors.dart';
import 'package:ko/presentaion/widgets/cart/cartItemTab.dart';
import 'package:ko/presentaion/widgets/custome_alertdialogue.dart';
import 'package:provider/provider.dart';

import '../../widgets/cart/cartitem.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final memeberguestProvider = Provider.of<MemberGuestProvider>(context);
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final box = GetStorage();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: kTextTabBarHeight + height * 0.025,
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
        leading: Consumer<BottomNavProvider>(
          builder: (context, value, child) =>
              bottomNavProvider.selectedIndex == 2
                  ? SizedBox.shrink()
                  : IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.white,
                      )),
        ),
        title: const Text(
          "Cart",
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Consumer<CartProvider>(
              builder: (context, value, child) =>
                  cartProvider.cartItemList.isEmpty
                      ? const SizedBox.shrink()
                      : IconButton(
                          onPressed: () {
                            customAlertDialogue(
                                title: "Alert",
                                content: "Are you sure to clear Items in cart",
                                txtbuttonName1: "cancel",
                                txtbutton1Action: () {
                                  Get.back();
                                },
                                txtbuttonName2: "yes",
                                txtbutton2Action: () {
                                  cartProvider.clearItemList();
                                });
                          },
                          icon: const Icon(
                            Icons.delete_outline_outlined,
                            size: 30,
                            color: AppColors.white,
                          ))),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return CartItemMenuTab();
              } else {
                return const CartItemMenu();
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer<CartProvider>(
            builder: (context, value, child) => cartProvider
                    .cartItemList.isEmpty
                ? const SizedBox.shrink()
                : LayoutBuilder(builder: (context, constraints) {
                    if (constraints.maxWidth > 600) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 20),
                        child: SizedBox(
                            height: 45,
                            width: width,
                            child: Consumer<CartProvider>(
                              builder: (context, value, child) => cartProvider
                                      .cartsaveLoading
                                  ? const SizedBox(
                                      height: 40,
                                      width: 20,
                                      child: Center(
                                          child: CircularProgressIndicator()))
                                  : ElevatedButton(
                                      onPressed: () {
                                        cartProvider.cartSave(
                                            memeberguestProvider
                                                .counterNocontroller,
                                            memeberguestProvider
                                                .memeberOrGuestcontroller,
                                            memeberguestProvider
                                                .biocardNoTexteditingCntlr.text,
                                            memeberguestProvider
                                                .memberNoTextedTexteditingCntlr
                                                .text,
                                            memeberguestProvider
                                                .groupcontroller,
                                            memeberguestProvider
                                                .waiterController,
                                            memeberguestProvider.ratecontroller,
                                            memeberguestProvider
                                                .remarkcontroller.text,
                                            box.read(
                                                LocalStorageNames.usernameKEY),
                                            memeberguestProvider
                                                .tablecontroller.text);
                                        setState(() {
                                          memeberguestProvider
                                              .waiterNameController = "";
                                          memeberguestProvider.balanceCntlr =
                                              "";
                                          memeberguestProvider
                                              .biocardNoTexteditingCntlr
                                              .clear();
                                          memeberguestProvider.isGuestSelected =
                                              false;
                                          memeberguestProvider
                                              .isMemberSelected = false;
                                          memeberguestProvider
                                              .memberNoTextedTexteditingCntlr
                                              .clear();
                                          memeberguestProvider.nameCntlr = "";
                                          memeberguestProvider.tablecontroller
                                              .clear();
                                          memeberguestProvider.remarkcontroller
                                              .clear();
                                          memeberguestProvider.counterList
                                              .clear();
                                          memeberguestProvider.waiterList
                                              .clear();
                                          memeberguestProvider.remarkcontroller
                                              .clear();
                                          memeberguestProvider
                                              .waiterNameController = "";

                                          debugPrint(
                                              "a----------${memeberguestProvider.waiterNameController}");
                                          debugPrint(
                                              "bb----------${memeberguestProvider.isGuestSelected}");
                                        });
                                      },
                                      child: const Text("Place Order"),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.red,
                                          foregroundColor: AppColors.white),
                                    ),
                            )),
                      );
                    } else {
                      return SizedBox(
                          height: 45,
                          width: width,
                          child: Consumer<CartProvider>(
                            builder: (context, value, child) => cartProvider
                                    .cartsaveLoading
                                ? const SizedBox(
                                    height: 40,
                                    width: 20,
                                    child: Center(
                                        child: CircularProgressIndicator()))
                                : ElevatedButton(
                                    onPressed: () {
                                      cartProvider.cartSave(
                                          memeberguestProvider
                                              .counterNocontroller,
                                          memeberguestProvider
                                              .memeberOrGuestcontroller,
                                          memeberguestProvider
                                              .biocardNoTexteditingCntlr.text,
                                          memeberguestProvider
                                              .memberNoTextedTexteditingCntlr
                                              .text,
                                          memeberguestProvider.groupcontroller,
                                          memeberguestProvider.waiterController,
                                          memeberguestProvider.ratecontroller,
                                          memeberguestProvider
                                              .remarkcontroller.text,
                                          box.read(
                                              LocalStorageNames.usernameKEY),
                                          memeberguestProvider
                                              .tablecontroller.text);
                                      setState(() {
                                        memeberguestProvider
                                            .waiterNameController = "";
                                        memeberguestProvider.balanceCntlr = "";
                                        memeberguestProvider
                                            .biocardNoTexteditingCntlr
                                            .clear();
                                        memeberguestProvider.isGuestSelected =
                                            false;
                                        memeberguestProvider.isMemberSelected =
                                            false;
                                        memeberguestProvider
                                            .memberNoTextedTexteditingCntlr
                                            .clear();
                                        memeberguestProvider.nameCntlr = "";
                                        memeberguestProvider.tablecontroller
                                            .clear();
                                        memeberguestProvider.remarkcontroller
                                            .clear();
                                        memeberguestProvider.counterList
                                            .clear();
                                        memeberguestProvider.waiterList.clear();
                                        memeberguestProvider.remarkcontroller
                                            .clear();
                                        memeberguestProvider
                                            .waiterNameController = "";

                                        debugPrint(
                                            "a----------${memeberguestProvider.waiterNameController}");
                                        debugPrint(
                                            "bb----------${memeberguestProvider.isGuestSelected}");
                                      });
                                    },
                                    child: const Text("Place Order"),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.red,
                                        foregroundColor: AppColors.white),
                                  ),
                          ));
                    }
                  }),
          )
        ],
      ),
    ));
  }
}
