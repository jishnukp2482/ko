import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../manager/controller/cart/billing_provider.dart';

class BillingitemTableItems extends StatelessWidget {
  const BillingitemTableItems({super.key});

  @override
  Widget build(BuildContext context) {
    final billingprovider = Provider.of<BillingProvider>(context);
    return DataTable(
      columns: [
        DataColumn(label: Text('KOT No')),
        DataColumn(label: Text('Item')),
        DataColumn(label: Text('Amount')),
      ],
      rows: billingprovider.billingitemlist.map((item) {
        return DataRow(cells: [
          DataCell(Text(item.kotno)),
          DataCell(Text(item.item)),
          DataCell(Text(item.amt)),
        ]);
      }).toList(),
    );
  }
}
