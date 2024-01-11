import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ko/presentaion/manager/controller/cart/cartProvider.dart';
import 'package:ko/presentaion/manager/controller/kotandbot/kot_provider.dart';
import 'package:ko/presentaion/manager/controller/kotandbot/memeber_provider.dart';
import 'package:ko/presentaion/widgets/cart/cartviwPage.dart';
import 'package:provider/provider.dart';
import '../../themes/appcolors.dart';
import '../../widgets/kot/item_Menu.dart';
import '../../widgets/kot/item_menuTab.dart';
import '../../widgets/kot/sub_row_menu.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final guestcontroller = Provider.of<MemberGuestProvider>(context);
    final kotProvider = Provider.of<KotProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    return SafeArea(
        child: Scaffold(
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
                kotProvider.searchcontroller.clear();
                Get.back();
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
                          ? guestcontroller.memberNoTextedTexteditingCntlr.text
                          : guestcontroller.biocardNoTexteditingCntlr.text,
                      style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
                ],
              ),
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
              SizedBox(
                height: height * 0.01,
              ),
            ],
          )),
      body: PopScope(
        canPop: true,
        onPopInvoked: (didPop) async {
          kotProvider.searchcontroller.clear();
          Get.back();
          return Future.value(true);
        },
        child: Row(
          mainAxisAlignment: cartProvider.cartItemList.isEmpty
              ? MainAxisAlignment.start
              : MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  const SubCategoryRowMenu(),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: height * 0.04,
                            decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: AppColors.black.withOpacity(0.5)),
                            ),
                            child: TextFormField(
                              controller: kotProvider.searchcontroller,
                              onChanged: (value) {
                                debugPrint("searched value==$value");
                                setState(() {
                                  kotProvider.fiterItemsInSearch(value);
                                });
                              },
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: AppColors.black,
                                  ),
                                  hintText: "Search Here",
                                  hintStyle: TextStyle(
                                    color: AppColors.black,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Consumer<KotProvider>(
                    builder: (context, value, child) {
                      final data = kotProvider.filteredSearchItemslist;
                      if (kotProvider.issubItemLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (data.isNotEmpty) {
                        return LayoutBuilder(
                          builder: (context, constraints) {
                            if (constraints.maxWidth > 600) {
                              return ItemModalMenuTab();
                            } else {
                              return ItemModalMenu();
                            }
                          },
                        );
                      } else {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "No item found",
                              style: TextStyle(color: AppColors.black),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            cartProvider.cartItemList.isEmpty
                ? SizedBox.shrink()
                : Expanded(child: Cartview()),
          ],
        ),
      ),
    ));
  }
}
