import 'package:equatable/equatable.dart';

class CartOrderModel extends Equatable {
  final String item;
  final String itemCode;
  final String orderType;
  final String qty;
  final String itemrate;
  final String total;
  final String description;
  CartOrderModel(
    this.item,
    this.itemCode,
    this.qty,
    this.orderType,
    this.itemrate,
    this.total,
    this.description,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
        item,
        itemCode,
        qty,
        orderType,
        itemrate,
        description,
      ];
  Map<String, dynamic> tojosn() {
    return {
      "item": item,
      "itemCode": itemCode,
      "orderType": orderType,
      "qty": qty,
      "itemrate": itemrate,
      "total": total,
      "description": description,
    };
  }
}
