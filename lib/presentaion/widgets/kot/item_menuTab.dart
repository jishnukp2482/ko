import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:get/get.dart';
import 'package:ko/data/remote/modals/response/kotItemsResponseModal.dart';
import 'package:ko/presentaion/manager/controller/kotandbot/kot_provider.dart';
import 'package:ko/presentaion/routes/app_pages.dart';
import 'package:ko/presentaion/widgets/custome_alertdialogue.dart';
import 'package:provider/provider.dart';
import '../../manager/controller/cart/cartProvider.dart';
import '../../themes/appcolors.dart';

class ItemModalMenuTab extends StatefulWidget {
  const ItemModalMenuTab({super.key});

  @override
  State<ItemModalMenuTab> createState() => _ItemModalMenuTabState();
}

class _ItemModalMenuTabState extends State<ItemModalMenuTab> {
  @override
  Widget build(BuildContext context) {
    final kotcontroller = Provider.of<KotProvider>(context);
    return Consumer<KotProvider>(
      builder: (context, value, child) => kotcontroller.issubItemLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              // key: UniqueKey(),
              shrinkWrap: true,
              itemCount: kotcontroller.filteredSearchItemslist.length,
              itemBuilder: (context, index) {
                return Consumer<KotProvider>(
                  builder: (context, value, child) =>
                      kotcontroller.issubItemLoading2
                          ? const SizedBox.shrink()
                          : ItemModalItemTab(
                              itemModal:
                                  kotcontroller.filteredSearchItemslist[index]),
                );
              },
            ),
    );
  }
}

class ItemModalItemTab extends StatefulWidget {
  const ItemModalItemTab({
    super.key,
    required this.itemModal,
  });
  final ItemsDatum itemModal;

  @override
  State<ItemModalItemTab> createState() => _ItemModalItemTabState();
}

class _ItemModalItemTabState extends State<ItemModalItemTab> {
  ValueNotifier<double> price = ValueNotifier<double>(0);
  ValueNotifier<double> total = ValueNotifier<double>(0);
  ValueNotifier<String> selectedType = ValueNotifier<String>("");
  ValueNotifier<String> quantitytextValueNotifier = ValueNotifier<String>('');
  ValueNotifier<String> descriptiontextValueNotifier =
      ValueNotifier<String>('');

  double selectedprice = 0.0;
  @override
  Widget build(BuildContext context) {
    // ValueNotifier<double> price = ValueNotifier<double>(0);
    // ValueNotifier<String> selectedType = ValueNotifier<String>("");
    // ValueNotifier<String> quantitytextValueNotifier = ValueNotifier<String>('');
    // ValueNotifier<String> descriptiontextValueNotifier = ValueNotifier<String>('');

    final cartProvider = Provider.of<CartProvider>(context);
    final kotProvider = Provider.of<KotProvider>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
      child: SizedBox(
          height: height * 0.27,
          width: width,
          child: Card(
            color: AppColors.white,
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  width * 0.05, height * 0.005, width * 0.005, height * 0.005),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.007, top: height * 0.005),
                        child: Text(
                          widget.itemModal.itemName,
                          style: const TextStyle(
                              color: AppColors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: height * 0.005,
                      ),
                      SizedBox(
                        height: height * 0.04,
                        width: width * 0.8,
                        child: DropdownSearch<OrderType>(
                          // autoValidateMode: AutovalidateMode.always,
                          validator: (value) {
                            if (value == null) {
                              return "Required Field";
                            }
                            return null;
                          },
                          itemAsString: (item) => item.name,
                          enabled: true,
                          popupProps: const PopupProps.menu(fit: FlexFit.loose),
                          items: [widget.itemModal.orderType] ?? [],
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              isDense: false,
                              labelText: "select",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: AppColors.black,
                                width: 0.3,
                              )),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: AppColors.blue,
                                width: 0.3,
                              )),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: AppColors.black,
                                width: 0.3,
                              )),
                              disabledBorder: OutlineInputBorder(),
                              hintText: "Serve",
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                              contentPadding: EdgeInsets.all(5),
                            ),
                          ),
                          onChanged: (value) {
                            final item = widget.itemModal.itemRate;
                            debugPrint("price:$item");
                            // if (quantitytextValueNotifier.value == "") {
                            //   quantitytextValueNotifier.value = "1";
                            // }
                            price.value = item;
                            selectedprice = 0.0;
                            selectedprice = item;
                            debugPrint(
                                "selected type in dropdown==${value.toString()}");
                            String result =
                                value.toString().replaceFirst('OrderType.', '');
                            selectedType.value = result;
                            debugPrint(
                                "selected type in dropdown==${selectedType.value.toString()}");
                          },
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      //quantity
                      Row(
                        children: [
                          /// ValueListenableBuilder<String>(
                          ///   // valueListenable: quantitytextValueNotifier,
                          ///   builder: (context, value, child) {
                          ///     final FocusNode _focusNode = FocusNode();
                          ///     return
                          SizedBox(
                            height: height * 0.04,
                            width: width * 0.4,
                            child: TextFormField(
                              // focusNode: _focusNode,
                              // controller: kotProvider.qtycontroller,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: AppColors.black,
                                  width: 0.3,
                                )),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: AppColors.blue,
                                  width: 0.3,
                                )),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: AppColors.black,
                                  width: 0.3,
                                )),
                                disabledBorder: const OutlineInputBorder(),
                                hintText: quantitytextValueNotifier.value == ""
                                    ? "quantity "
                                    : quantitytextValueNotifier.value,
                                // "HU",
                                hintStyle: TextStyle(
                                  color: quantitytextValueNotifier.value == ""
                                      ? AppColors.grey
                                      : AppColors.black,
                                ),
                                contentPadding: const EdgeInsets.all(5),
                              ),
                              keyboardType: TextInputType.number,
                              // onTap: () {
                              //   FocusScope.of(context)
                              //       .requestFocus(_focusNode);
                              // },
                              onChanged: (onchangedvalue) {
                                debugPrint("onchagedvalue==$onchangedvalue");
                                quantitytextValueNotifier.value =
                                    onchangedvalue;
                                debugPrint(
                                    "onchanged value==${quantitytextValueNotifier.value}");

                                debugPrint(
                                    "qty==${quantitytextValueNotifier.value}");
                                debugPrint("price==$selectedprice");
                                double currentprice = selectedprice;

                                int qty = int.tryParse(
                                        quantitytextValueNotifier.value) ??
                                    0;
                                double subTotal = (currentprice * qty);
                                total.value = subTotal;
                                debugPrint("SubTotal=$subTotal");
                              },
                            ),

                            /// );
                            /// },
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          ValueListenableBuilder<double>(
                            valueListenable: price,
                            builder: (context, value, child) {
                              return SizedBox(
                                  height: height * 0.04,
                                  width: width * 0.38,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    readOnly:
                                        widget.itemModal.rateEditable == false
                                            ? true
                                            : false,
                                    decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                          color: AppColors.black,
                                          width: 0.3,
                                        )),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                          color: AppColors.blue,
                                          width: 0.3,
                                        )),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                          color: AppColors.black,
                                          width: 0.3,
                                        )),
                                        disabledBorder:
                                            const OutlineInputBorder(),
                                        hintText: "$value ",
                                        hintStyle: const TextStyle(
                                          color: Colors.black,
                                        ),
                                        contentPadding:
                                            const EdgeInsets.all(5)),
                                  ));
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.007,
                      ),
                      ValueListenableBuilder<String>(
                        valueListenable: descriptiontextValueNotifier,
                        builder: (context, value, child) {
                          return SizedBox(
                              height: height * 0.04,
                              width: width * 0.8,
                              child: TextFormField(
                                maxLength: 25,
                                buildCounter: (BuildContext context,
                                        {int? currentLength,
                                        int? maxLength,
                                        required bool isFocused}) =>
                                    null,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: AppColors.black,
                                      width: 0.3,
                                    )),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: AppColors.blue,
                                      width: 0.3,
                                    )),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: AppColors.black,
                                      width: 0.3,
                                    )),
                                    disabledBorder: OutlineInputBorder(),
                                    hintText: "Enter Description ",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    contentPadding: EdgeInsets.all(5)),
                                onChanged: (value) {
                                  descriptiontextValueNotifier.value = value;
                                },
                              ));
                        },
                      ),
                      SizedBox(
                        height: height * 0.0054,
                      ),
                      SizedBox(
                        width: width * 0.8,
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              "Total",
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
                                child: Text(
                              "₹ ${total.value.toString()}",
                              style: TextStyle(color: AppColors.black),
                            ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.0054,
                      ),
                      SizedBox(
                        width: width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ///Add button
                            GestureDetector(
                              onTap: () {
                                if (selectedType.value.isEmpty) {
                                  customAlertDialogue(
                                      title: "Alert",
                                      content: "please select a type",
                                      txtbuttonName1: "Tryagain",
                                      txtbutton1Action: () {
                                        Get.back();
                                      });
                                } else if (quantitytextValueNotifier
                                    .value.isEmpty) {
                                  customAlertDialogue(
                                      title: "Alert",
                                      content: "please enter quantity",
                                      txtbuttonName1: "Tryagain",
                                      txtbutton1Action: () {
                                        Get.back();
                                      });
                                } else {
                                  cartProvider.addToCart(
                                      widget.itemModal.itemName,
                                      widget.itemModal.itemCode,
                                      selectedType.value,
                                      quantitytextValueNotifier.value
                                          .toString(),
                                      price.value.toString(),
                                      total.value.toString(),
                                      descriptiontextValueNotifier.value);
                                  customAlertDialogue(
                                      title: "",
                                      content: " item added to cart",
                                      txtbuttonName1: "View Cart",
                                      txtbuttonName2: "Back",
                                      txtbutton1Action: () {
                                        Get.toNamed(AppPages.cartpage);
                                      },
                                      txtbutton2Action: () {
                                        Get.back();
                                      });
                                }
                              },
                              child: SizedBox(
                                height: height * 0.03,
                                width: width * 0.15,
                                child: Consumer<CartProvider>(
                                  builder: (context, value, child) =>
                                      cartProvider.cartLoading
                                          ? const CircularProgressIndicator()
                                          : ElevatedButton(
                                              onPressed: null,
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      AppColors.red,
                                                  foregroundColor:
                                                      AppColors.white),
                                              child: const Text("Add"),
                                            ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
