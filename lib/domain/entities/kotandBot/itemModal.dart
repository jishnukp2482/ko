
import 'package:ko/domain/entities/kotandBot/serv_modal.dart';

class ItemModal {
  final int mainID;
  final int subID;
  final int itemID;
  final String itemImg;
  final String itemName;
  final List<ServModal> serveList;

  ItemModal(this.mainID, this.subID, this.itemID, this.itemName, this.itemImg,
      this.serveList);
}
