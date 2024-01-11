import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ko/domain/entities/cart/cartOrderModel.dart';
import 'package:ko/presentaion/themes/app_assets.dart';
import 'package:provider/provider.dart';

import '../../manager/controller/cart/cartProvider.dart';
import '../../routes/app_pages.dart';
import '../../themes/appcolors.dart';

class Cartview extends StatelessWidget {
  const Cartview({super.key});

  @override
  Widget build(BuildContext context) {
    final cartprovider = Provider.of<CartProvider>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        SizedBox(height: height * 0.7, child: Cartview()),
        Consumer<CartProvider>(
          builder: (context, value, child) => cartprovider.cartItemList.isEmpty
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
      ],
    );
  }
}

class CartViewMenu extends StatefulWidget {
  const CartViewMenu({super.key});

  @override
  State<CartViewMenu> createState() => _CartViewMenuState();
}

class _CartViewMenuState extends State<CartViewMenu> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final cartprovider = Provider.of<CartProvider>(context);
    return Consumer<CartProvider>(builder: (context, value, child) {
      if (cartprovider.cartLoading) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.3,
            ),
            Center(
              child: CircularProgressIndicator(),
            ),
          ],
        );
      } else if (cartprovider.cartItemList.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.3,
            ),
            Center(
              child: Text(
                "your cart is empty",
                style: TextStyle(color: AppColors.grey, fontSize: 18),
              ),
            ),
          ],
        );
      } else {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: cartprovider.cartItemList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return CartViewItem(
              itemImg: AppAssets.biriyani,
              itemName: cartprovider.cartItemList[index].item,
              selectedType: cartprovider.cartItemList[index].orderType,
              qty: cartprovider.cartItemList[index].qty,
              subTotal: cartprovider.cartItemList[index].itemrate.toString(),
              cartOrderModel: cartprovider.cartItemList[index],
            );
          },
        );
      }
    });
  }
}

class CartViewItem extends StatelessWidget {
  const CartViewItem(
      {super.key,
      required this.itemImg,
      required this.itemName,
      required this.selectedType,
      required this.qty,
      required this.subTotal,
      required this.cartOrderModel});
  final String itemImg;
  final String itemName;
  final String selectedType;
  final String qty;
  final String subTotal;
  final CartOrderModel cartOrderModel;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final cartprovider = Provider.of<CartProvider>(context);
    return SizedBox(
      height: cartOrderModel.description.isEmpty
          ? height * 0.20
          : cartOrderModel.description.length + 2 * (height * 0.12),
      width: width * 0.4,
      child: Card(
        color: AppColors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(children: [
          Positioned(
              right: 0,
              child: IconButton(
                  onPressed: () {
                    cartprovider.removeFromCart(cartOrderModel);
                  },
                  icon: Icon(
                    Icons.delete_outline_outlined,
                    color: AppColors.red,
                  ))),
          Padding(
            padding: EdgeInsets.fromLTRB(
                width * 0.01, height * 0.001, width * 0.01, height * 0.001),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.005, top: height * 0.005),
                      child: Text(
                        itemName ?? "n/a",
                        style: const TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    SizedBox(
                      //color: AppColors.green,
                      width: width * 0.8,
                      child: Row(
                        children: [
                          const Expanded(
                              child: Text(
                            "Type",
                            style: TextStyle(color: AppColors.black),
                          )),
                          const Expanded(
                              child: Center(
                                  child: Text(
                            ":",
                            style: TextStyle(color: AppColors.black),
                          ))),
                          Expanded(
                              child: Text(
                            selectedType ?? "0",
                            style: const TextStyle(color: AppColors.black),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    SizedBox(
                      //color: AppColors.green,
                      width: width * 0.8,
                      child: Row(
                        children: [
                          const Expanded(
                              child: Text(
                            "Item rate",
                            style: TextStyle(color: AppColors.black),
                          )),
                          const Expanded(
                              child: Center(
                                  child: Text(
                            ":",
                            style: TextStyle(color: AppColors.black),
                          ))),
                          Expanded(
                              child: Text(
                            "₹ ${cartOrderModel.itemrate ?? "0"}",
                            style: const TextStyle(color: AppColors.black),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    SizedBox(
                      // color: AppColors.green,
                      width: width * 0.8,
                      child: Row(
                        children: [
                          const Expanded(
                              child: Text(
                            "Qty",
                            style: TextStyle(color: AppColors.black),
                          )),
                          const Expanded(
                              child: Center(
                                  child: Text(
                            ":",
                            style: TextStyle(color: AppColors.black),
                          ))),
                          Expanded(
                              child: Text(
                            qty ?? "0",
                            style: const TextStyle(color: AppColors.black),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    SizedBox(
                      // color: AppColors.green,
                      width: width * 0.8,
                      child: Row(
                        children: [],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    cartOrderModel.description.isNotEmpty
                        ? SizedBox(
                            width: width * 0.8,
                            child: Row(
                              children: [
                                const Expanded(
                                    child: Text(
                                  "Description",
                                  style: TextStyle(color: AppColors.black),
                                )),
                                const Expanded(
                                    child: Center(
                                        child: Text(
                                  ":",
                                  style: TextStyle(color: AppColors.black),
                                ))),
                                Expanded(
                                    child: Text(
                                  cartOrderModel.description ?? "",
                                  style:
                                      const TextStyle(color: AppColors.black),
                                )),
                              ],
                            ),
                          )
                        : SizedBox.shrink(),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    SizedBox(
                      // color: AppColors.green,
                      width: width * 0.8,
                      child: Row(
                        children: [
                          const Expanded(
                              child: Text(
                            "Total",
                            style: TextStyle(color: AppColors.black),
                          )),
                          const Expanded(
                              child: Center(
                                  child: Text(
                            ":",
                            style: TextStyle(color: AppColors.black),
                          ))),
                          Expanded(
                              child: Text(
                            "₹ ${cartOrderModel.total ?? "0"}",
                            style: const TextStyle(color: AppColors.black),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
