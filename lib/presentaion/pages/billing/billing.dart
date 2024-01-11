import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ko/presentaion/manager/controller/bottom_nav_provider.dart';
import 'package:ko/presentaion/manager/controller/cart/billing_provider.dart';
import 'package:ko/presentaion/themes/appcolors.dart';

import 'package:provider/provider.dart';

import '../../widgets/billing/billingitemtabel.dart';
import '../../widgets/custome_textfield.dart';

class Billingpage extends StatefulWidget {
  const Billingpage({super.key});

  @override
  State<Billingpage> createState() => _BillingpageState();
}

class _BillingpageState extends State<Billingpage> {
  @override
  Widget build(BuildContext context) {
    final billingprovider = Provider.of<BillingProvider>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);
    double padding = 0.0;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + height * 0.05,
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
              bottomNavProvider.selectedIndex == 1
                  ? SizedBox.shrink()
                  : IconButton(
                      onPressed: () {
                        billingprovider.biocardNoTexteditingCntlr.clear();
                        billingprovider.isGuestSelected = false;
                        billingprovider.isMemberSelected = false;
                        billingprovider.memberNoTextedTexteditingCntlr.clear();
                        billingprovider.nameCntlr = "";

                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.white,
                      )),
        ),
        title: const Text(
          "Bill Payment",
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          billingprovider.biocardNoTexteditingCntlr.clear();
          billingprovider.isGuestSelected = false;
          billingprovider.isMemberSelected = false;
          billingprovider.memberNoTextedTexteditingCntlr.clear();
          billingprovider.nameCntlr = "";
          Future.value(true);
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return ListView(
                padding: EdgeInsets.all(30),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        "Member/Guest",
                        style: TextStyle(color: AppColors.black),
                      )),
                      Expanded(
                          child: Center(
                        child: Text(
                          ":",
                          style: TextStyle(color: AppColors.black),
                        ),
                      )),
                      Expanded(
                        flex: 2,
                        child: DropdownSearch<String>(
                          popupProps: const PopupProps.menu(
                              showSelectedItems: true, fit: FlexFit.loose),
                          items: const [
                            "Member",
                            "Guest",
                          ],
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: AppColors.grey)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: AppColors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: AppColors.grey)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: AppColors.grey)),
                              labelText: "select type",
                              hintText: "Member / Guest",
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              billingprovider.nameCntlr = "";
                              billingprovider.memberNoTextedTexteditingCntlr
                                  .clear();
                              billingprovider.biocardNoTexteditingCntlr.clear();
                              billingprovider.memeberOrGuestcontroller = value!;
                              billingprovider.memberSelected();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Consumer<BillingProvider>(
                    builder: (context, value, child) =>
                        billingprovider.isGuestSelected
                            ? Row(
                                children: [
                                  const Expanded(
                                      child: Text(
                                    "Bio Card NO",
                                    style: TextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500),
                                  )),
                                  const Expanded(
                                      flex: 1,
                                      child: Center(
                                          child: Text(
                                        ":",
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500),
                                      ))),
                                  Expanded(
                                      flex: 2,
                                      child: CustomTextField(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: height * 0.007,
                                            horizontal: 10),
                                        controller: billingprovider
                                            .biocardNoTexteditingCntlr,
                                        hintText: "Enter Bio Card No",
                                        label: const Text("Bio Card No"),
                                        onchanged: (value) {
                                          billingprovider.getValidateMember();
                                        },
                                      )),
                                ],
                              )
                            : const SizedBox.shrink(),
                  ),
                  Consumer<BillingProvider>(
                    builder: (context, value, child) =>
                        billingprovider.isMemberSelected ||
                                billingprovider
                                    .biocardNoTexteditingCntlr.text.isNotEmpty
                            ? Row(
                                children: [
                                  const Expanded(
                                      child: Text(
                                    " Member No",
                                    style: TextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500),
                                  )),
                                  const Expanded(
                                      child: Center(
                                    child: Text(
                                      ":",
                                      style: TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                                  Expanded(
                                      flex: 2,
                                      child: CustomTextField(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: height * 0.007,
                                            horizontal: 10),
                                        controller: billingprovider
                                            .memberNoTextedTexteditingCntlr,
                                        hintText: "Enter Member No",
                                        label: Text(
                                            billingprovider
                                                    .biocardNoTexteditingCntlr
                                                    .text
                                                    .isNotEmpty
                                                ? billingprovider
                                                    .biocardNoTexteditingCntlr
                                                    .text
                                                : "Member No",
                                            style: TextStyle(
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w500)),
                                        inputType: billingprovider
                                                .biocardNoTexteditingCntlr
                                                .text
                                                .isNotEmpty
                                            ? TextInputType.none
                                            : TextInputType.text,
                                        enable: billingprovider
                                                .biocardNoTexteditingCntlr
                                                .text
                                                .isNotEmpty
                                            ? false
                                            : true,
                                        readOnly: billingprovider
                                                .biocardNoTexteditingCntlr
                                                .text
                                                .isNotEmpty
                                            ? true
                                            : false,
                                        onchanged: (value) {
                                          debugPrint("member no==$value");
                                          billingprovider.getValidateMember();
                                        },
                                      )),
                                ],
                              )
                            : const SizedBox.shrink(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Expanded(
                          child: Text("Name",
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500))),
                      const Expanded(
                          child: Center(
                        child: Text(":",
                            style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500)),
                      )),
                      Expanded(
                        flex: 2,
                        child: CustomTextField(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: height * 0.007, horizontal: 10),
                            readOnly: true,
                            enable: false,
                            inputType: TextInputType.none,
                            hintText: billingprovider.nameCntlr,
                            label: Text(
                              billingprovider.nameCntlr,
                              style: const TextStyle(color: AppColors.black),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Divider(),
                  BillingitemTableItems(),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Total : 0",
                          style: TextStyle(color: AppColors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Save"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.red,
                          foregroundColor: AppColors.white),
                    ),
                  )
                ],
              );
            } else {
              return ListView(
                padding: EdgeInsets.all(10),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        "Member/Guest",
                        style: TextStyle(color: AppColors.black),
                      )),
                      Expanded(
                          child: Center(
                        child: Text(
                          ":",
                          style: TextStyle(color: AppColors.black),
                        ),
                      )),
                      Expanded(
                        flex: 2,
                        child: DropdownSearch<String>(
                          popupProps: const PopupProps.menu(
                              showSelectedItems: true, fit: FlexFit.loose),
                          items: const [
                            "Member",
                            "Guest",
                          ],
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: AppColors.grey)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: AppColors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: AppColors.grey)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: AppColors.grey)),
                              labelText: "select type",
                              hintText: "Member / Guest",
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              billingprovider.nameCntlr = "";
                              billingprovider.memberNoTextedTexteditingCntlr
                                  .clear();
                              billingprovider.biocardNoTexteditingCntlr.clear();
                              billingprovider.memeberOrGuestcontroller = value!;
                              billingprovider.memberSelected();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Consumer<BillingProvider>(
                    builder: (context, value, child) =>
                        billingprovider.isGuestSelected
                            ? Row(
                                children: [
                                  const Expanded(
                                      child: Text(
                                    "Bio Card NO",
                                    style: TextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500),
                                  )),
                                  const Expanded(
                                      flex: 1,
                                      child: Center(
                                          child: Text(
                                        ":",
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500),
                                      ))),
                                  Expanded(
                                      flex: 2,
                                      child: CustomTextField(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: height * 0.007,
                                            horizontal: 10),
                                        controller: billingprovider
                                            .biocardNoTexteditingCntlr,
                                        hintText: "Enter Bio Card No",
                                        label: const Text("Bio Card No"),
                                        onchanged: (value) {
                                          billingprovider.getValidateMember();
                                        },
                                      )),
                                ],
                              )
                            : const SizedBox.shrink(),
                  ),
                  Consumer<BillingProvider>(
                    builder: (context, value, child) =>
                        billingprovider.isMemberSelected ||
                                billingprovider
                                    .biocardNoTexteditingCntlr.text.isNotEmpty
                            ? Row(
                                children: [
                                  const Expanded(
                                      child: Text(
                                    " Member No",
                                    style: TextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500),
                                  )),
                                  const Expanded(
                                      child: Center(
                                    child: Text(
                                      ":",
                                      style: TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                                  Expanded(
                                      flex: 2,
                                      child: CustomTextField(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: height * 0.007,
                                            horizontal: 10),
                                        controller: billingprovider
                                            .memberNoTextedTexteditingCntlr,
                                        hintText: "Enter Member No",
                                        label: Text(
                                            billingprovider
                                                    .biocardNoTexteditingCntlr
                                                    .text
                                                    .isNotEmpty
                                                ? billingprovider
                                                    .biocardNoTexteditingCntlr
                                                    .text
                                                : "Member No",
                                            style: TextStyle(
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w500)),
                                        inputType: billingprovider
                                                .biocardNoTexteditingCntlr
                                                .text
                                                .isNotEmpty
                                            ? TextInputType.none
                                            : TextInputType.text,
                                        enable: billingprovider
                                                .biocardNoTexteditingCntlr
                                                .text
                                                .isNotEmpty
                                            ? false
                                            : true,
                                        readOnly: billingprovider
                                                .biocardNoTexteditingCntlr
                                                .text
                                                .isNotEmpty
                                            ? true
                                            : false,
                                        onchanged: (value) {
                                          debugPrint("member no==$value");
                                          billingprovider.getValidateMember();
                                        },
                                      )),
                                ],
                              )
                            : const SizedBox.shrink(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Expanded(
                          child: Text("Name",
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500))),
                      const Expanded(
                          child: Center(
                        child: Text(":",
                            style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500)),
                      )),
                      Expanded(
                        flex: 2,
                        child: CustomTextField(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: height * 0.007, horizontal: 10),
                            readOnly: true,
                            enable: false,
                            inputType: TextInputType.none,
                            hintText: billingprovider.nameCntlr,
                            label: Text(
                              billingprovider.nameCntlr,
                              style: const TextStyle(color: AppColors.black),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Divider(),
                  BillingitemTableItems(),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Total : 0",
                          style: TextStyle(color: AppColors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Save"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.red,
                        foregroundColor: AppColors.white),
                  )
                ],
              );
            }
          },
        ),
      ),
    ));
  }
}
