import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:ko/core/respose_classify.dart';
import 'package:ko/data/remote/modals/response/locateCounterResponseModal.dart';
import 'package:ko/data/remote/modals/response/locateWaitersResponseModal.dart';
import 'package:ko/presentaion/manager/controller/kotandbot/kot_provider.dart';
import 'package:ko/presentaion/manager/controller/kotandbot/memeber_provider.dart';
import 'package:ko/presentaion/widgets/custome_alertdialogue.dart';
import 'package:provider/provider.dart';
import '../../themes/appcolors.dart';
import '../../widgets/custome_textfield.dart';

class MemeberGuestPage extends StatefulWidget {
  const MemeberGuestPage({super.key});

  @override
  State<MemeberGuestPage> createState() => _MemeberGuestPageState();
}

class _MemeberGuestPageState extends State<MemeberGuestPage> {
  @override
  @override
  void initState() {
    super.initState();
       WidgetsBinding.instance!.addPostFrameCallback((_) {
      final memberGuestController =
          Provider.of<MemberGuestProvider>(context, listen: false);
      memberGuestController.getCounters();
      memberGuestController.getWaiters();
      print('intit ${memberGuestController.isGuestSelected}');

       });
  }

  bool counterDatumCompare(CounterDatum item1, CounterDatum item2) {
    return item1.counterCode == item2.counterCode;
  }

  bool waiterDatumCompare(WaitersDatum item1, WaitersDatum item2) {
    return item1.waiterCode == item2.waiterCode;
  }

  @override
  Widget build(BuildContext context) {
    final memberGuestController = Provider.of<MemberGuestProvider>(context);
    final kotprovider = Provider.of<KotProvider>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
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
            leading: IconButton(
                onPressed: () {
                  memberGuestController.balanceCntlr = "";
                  memberGuestController.biocardNoTexteditingCntlr.clear();
                  memberGuestController.isGuestSelected = false;
                  memberGuestController.isMemberSelected = false;
                  memberGuestController.memberNoTextedTexteditingCntlr.clear();
                  memberGuestController.nameCntlr = "";
                  memberGuestController.tablecontroller.clear();
                  memberGuestController.remarkcontroller.clear();
                  memberGuestController.counterList.clear();
                  memberGuestController.waiterList.clear();
                  memberGuestController.remarkcontroller.clear();
                  memberGuestController.waiterNameController = "";
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.white,
                )),
            title: const Text(
              "Kot / Bot",
              style: TextStyle(
                  color: AppColors.white, fontWeight: FontWeight.bold),
            ),
          ),
          body: PopScope(
            canPop: true,
            onPopInvoked: (didPop) async {
              memberGuestController.balanceCntlr = "";
              memberGuestController.biocardNoTexteditingCntlr.clear();
              memberGuestController.isGuestSelected = false;
              memberGuestController.isMemberSelected = false;
              memberGuestController.memberNoTextedTexteditingCntlr.clear();
              memberGuestController.nameCntlr = "";
              memberGuestController.tablecontroller.clear();
              memberGuestController.remarkcontroller.clear();
              memberGuestController.counterList.clear();
              memberGuestController.waiterList.clear();
              memberGuestController.remarkcontroller.clear();
              memberGuestController.waiterNameController = "";
              return Future.value(true);
            },
            child: ListView(padding: const EdgeInsets.all(10), children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Expanded(
                      child: Text(
                    "Counter",
                    style: TextStyle(
                        color: AppColors.black, fontWeight: FontWeight.w500),
                  )),
                  const Expanded(
                      child: Center(
                    child: Text(":",
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500)),
                  )),
                  Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: height * 0.07,
                        child: Consumer<MemberGuestProvider>(
                          builder: (context, value, child) =>
                              memberGuestController.locateCounterState.status ==
                                      Status.LOADING
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : DropdownSearch<CounterDatum>(
                                      popupProps: const PopupProps.menu(
                                          showSelectedItems: true,
                                          fit: FlexFit.loose),
                                      items: memberGuestController.counterList,
                                      itemAsString: (item) => item.counterName,
                                      dropdownDecoratorProps:
                                          DropDownDecoratorProps(
                                        dropdownSearchDecoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color: AppColors.grey)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color: AppColors.grey)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color: AppColors.grey)),
                                            disabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color: AppColors.grey)),
                                            labelText: "Counter No",
                                            hintText: "Select Counter No",
                                            contentPadding:
                                                EdgeInsets.all(height * 0.01),
                                            isDense: true),
                                      ),
                                      compareFn: counterDatumCompare,
                                      onChanged: (value) {
                                        memberGuestController
                                                .counterNocontroller =
                                            value!.counterCode;
                                      },
                                    ),
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Expanded(
                      child: Text(
                    "Member / Guest",
                    style: TextStyle(
                        color: AppColors.black, fontWeight: FontWeight.w500),
                  )),
                  const Expanded(
                      child: Center(
                    child: Text(
                      ":",
                      style: TextStyle(
                          color: AppColors.black, fontWeight: FontWeight.w500),
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
                            memberGuestController.nameCntlr = "";
                            memberGuestController.balanceCntlr = "";
                            memberGuestController.memberNoTextedTexteditingCntlr
                                .clear();
                            memberGuestController.biocardNoTexteditingCntlr
                                .clear();
                            memberGuestController.memeberOrGuestcontroller =
                                value!;
                            memberGuestController.memberSelected();
                          });
                        },
                      )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Consumer<MemberGuestProvider>(
                builder: (context, value, child) =>
                    memberGuestController.isGuestSelected
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
                                    controller: memberGuestController
                                        .biocardNoTexteditingCntlr,
                                    hintText: "Enter Bio Card No",
                                    label: const Text("Bio Card No"),
                                    onchanged: (value) {
                                      memberGuestController.getValidateMember();
                                      // if (value == "1") {
                                      //   memberGuestController.nameCntlr = "Ram";
                                      //   memberGuestController.balanceCntlr = "5000";
                                      //   memberGuestController
                                      //       .memberNoTextedTexteditingCntlr
                                      //       .text = "101";
                                      // } else if (value == "2") {
                                      //   memberGuestController.nameCntlr =
                                      //       "Navaneeth";
                                      //   memberGuestController.balanceCntlr = "50";
                                      //   memberGuestController
                                      //       .memberNoTextedTexteditingCntlr
                                      //       .text = "102";
                                      // }
                                    },
                                  )),
                            ],
                          )
                        : const SizedBox.shrink(),
              ),
              Consumer<MemberGuestProvider>(
                builder: (context, value, child) =>
                    memberGuestController.isMemberSelected ||
                            memberGuestController
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
                                    controller: memberGuestController
                                        .memberNoTextedTexteditingCntlr,
                                    hintText: "Enter Member No",
                                    label: Text(
                                        memberGuestController
                                                .biocardNoTexteditingCntlr
                                                .text
                                                .isNotEmpty
                                            ? memberGuestController
                                                .biocardNoTexteditingCntlr.text
                                            : "Member No",
                                        style: const TextStyle(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500)),
                                    inputType: memberGuestController
                                            .biocardNoTexteditingCntlr
                                            .text
                                            .isNotEmpty
                                        ? TextInputType.none
                                        : TextInputType.text,
                                    enable: memberGuestController
                                            .biocardNoTexteditingCntlr
                                            .text
                                            .isNotEmpty
                                        ? false
                                        : true,
                                    readOnly: memberGuestController
                                            .biocardNoTexteditingCntlr
                                            .text
                                            .isNotEmpty
                                        ? true
                                        : false,
                                    onchanged: (value) {
                                      debugPrint("member no==$value");
                                      memberGuestController.getValidateMember();
                                      // setState(() {
                                      //   if (value == "1") {
                                      //     memberGuestController.nameCntlr = "Das";
                                      //     memberGuestController.balanceCntlr =
                                      //         "10000";
                                      //   } else if (value == "2") {
                                      //     memberGuestController.nameCntlr =
                                      //         "Vishnu";
                                      //     memberGuestController.balanceCntlr =
                                      //         "10987650";
                                      //   }
                                      //   debugPrint(
                                      //       "member no tcontroller=${memberGuestController.memberNoTextedTexteditingCntlr.text}");
                                      //   debugPrint(
                                      //       "name ==${memberGuestController.nameCntlr}");
                                      //   debugPrint(
                                      //       "balance==${memberGuestController.balanceCntlr}");
                                      // });
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
                        hintText: memberGuestController.nameCntlr,
                        label: Text(
                          memberGuestController.nameCntlr,
                          style: const TextStyle(color: AppColors.black),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Expanded(
                      child: Text("Balance",
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
                          //controller: memberGuestController.balanceCntlr,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: height * 0.007, horizontal: 10),
                          readOnly: true,
                          enable: false,
                          hintText: memberGuestController.balanceCntlr,
                          label: Text(
                            memberGuestController.balanceCntlr,
                            style: const TextStyle(color: AppColors.black),
                          ))),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Group",
                            style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(
                          height: 5,
                        ),
                        DropdownSearch<String>(
                          popupProps: const PopupProps.menu(
                              showSelectedItems: true, fit: FlexFit.loose),
                          items: const [
                            "Group1",
                            "Group2",
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
                              labelText: "Group",
                              hintText: "select Group",
                            ),
                          ),
                          onChanged: (value) {
                            memberGuestController.groupcontroller = value!;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Waiter",
                            style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(
                          height: 5,
                        ),
                        Consumer<MemberGuestProvider>(
                          builder: (context, value, child) =>
                              memberGuestController.locateWaiterState.status ==
                                      Status.LOADING
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : DropdownSearch<WaitersDatum>(
                                      popupProps: const PopupProps.menu(
                                          showSelectedItems: true,
                                          fit: FlexFit.loose),
                                      items: memberGuestController.waiterList,
                                      itemAsString: (item) => item.waiterName,
                                      dropdownDecoratorProps:
                                          DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: AppColors.grey)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: AppColors.grey)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: AppColors.grey)),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: AppColors.grey)),
                                          labelText: "waiter",
                                          hintText: "select waiter",
                                        ),
                                      ),
                                      compareFn: waiterDatumCompare,
                                      onChanged: (value) {
                                        memberGuestController.waiterController =
                                            value!.waiterCode;
                                        memberGuestController
                                                .waiterNameController =
                                            value!.waiterName;
                                      },
                                    ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Table No",
                            style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextField(
                            controller: memberGuestController.tablecontroller,
                            inputType: TextInputType.number,
                            hintText: "Enter Table No",
                            label: const Text("Table No"))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Rate ",
                            style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(
                          height: 5,
                        ),
                        DropdownSearch<String>(
                          popupProps: const PopupProps.menu(
                              showSelectedItems: true, fit: FlexFit.loose),
                          items: const [
                            "Rate 1",
                            "Rate 2",
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
                              labelText: "Rate Type",
                              hintText: "select rate Type",
                            ),
                          ),
                          onChanged: (value) {
                            memberGuestController.ratecontroller = value!;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Expanded(
                      child: Text("Remarks",
                          style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w500))),
                  const Expanded(
                      child: Center(
                          child: Text(":",
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500)))),
                  Expanded(
                      flex: 2,
                      child: CustomTextField(
                          controller: memberGuestController.remarkcontroller,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: height * 0.007, horizontal: 10),
                          hintText: "Enter remarks",
                          label: const Text("Remarks"))),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        if (memberGuestController.counterNocontroller.isEmpty) {
                          customAlertDialogue(
                              title: "Error",
                              content: "select Counter No",
                              txtbuttonName1: "ok",
                              txtbutton1Action: () {
                                Get.back();
                              });
                        } else if (memberGuestController
                            .memeberOrGuestcontroller.isEmpty) {
                          customAlertDialogue(
                              title: "Error",
                              content: "select Member/Guest No",
                              txtbuttonName1: "ok",
                              txtbutton1Action: () {
                                Get.back();
                              });
                        } else if (memberGuestController
                            .groupcontroller.isEmpty) {
                          customAlertDialogue(
                              title: "Error",
                              content: "select Group ",
                              txtbuttonName1: "ok",
                              txtbutton1Action: () {
                                Get.back();
                              });
                        } else if (memberGuestController
                            .waiterController.isEmpty) {
                          customAlertDialogue(
                              title: "Error",
                              content: "select waiter ",
                              txtbuttonName1: "ok",
                              txtbutton1Action: () {
                                Get.back();
                              });
                        } else if (memberGuestController
                            .tablecontroller.text.isEmpty) {
                          customAlertDialogue(
                              title: "Error",
                              content: "Enter Table No ",
                              txtbuttonName1: "ok",
                              txtbutton1Action: () {
                                Get.back();
                              });
                        } else if (memberGuestController
                            .ratecontroller.isEmpty) {
                          customAlertDialogue(
                              title: "Error",
                              content: "select rate ",
                              txtbuttonName1: "ok",
                              txtbutton1Action: () {
                                Get.back();
                              });
                        } else {
                          kotprovider.getItems();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.red,
                          foregroundColor: AppColors.white),
                      child: const Text("continue"),
                    )),
              )
            ]),
          )),
    );
  }
}
