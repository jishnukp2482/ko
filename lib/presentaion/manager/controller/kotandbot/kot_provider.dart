import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ko/core/respose_classify.dart';
import 'package:ko/core/usecase.dart';
import 'package:ko/data/remote/modals/response/kotItemsResponseModal.dart';
import 'package:ko/domain/entities/kotandBot/mainCategoryModal.dart';
import 'package:ko/domain/usecase/kot/kotItemsUseCase.dart';

import '../../../../domain/entities/kotandBot/itemModal.dart';
import '../../../../domain/entities/kotandBot/serv_modal.dart';
import '../../../routes/app_pages.dart';
import '../../../themes/app_assets.dart';

class KotProvider extends ChangeNotifier {
  final KotItemsUseCase kotItemsUseCase;
  KotProvider(this.kotItemsUseCase);
  final mainCategory = <KOTcategoryModal>[
    KOTcategoryModal("LIQUOR", AppAssets.liquor, 0),
    KOTcategoryModal("FOOD", AppAssets.food, 1),
    KOTcategoryModal("OTHERS", AppAssets.others, 2),
  ];

  final qtycontroller = TextEditingController();

  bool isSelectedMainLoading = false;

  int selectedMainCategoryIndex = 0;

  int selectedSubCategoryIndex = 0;
  int selectedSubItem = 0;

  void selectedMaincategory(int index, String maingroup) {
    isSelectedMainLoading = true;
    selectedMainCategoryIndex = index;

    filteredSubItemsList.clear();
    fiteredSubITems(maingroup);
    isSelectedMainLoading = false;
    notifyListeners();
  }

  void selectedSubCategory(int index) {
    issubItemLoading = true;
    selectedSubCategoryIndex = index;
    issubItemLoading = false;
    notifyListeners();
  }

  final itemList = <ItemsDatum>[];
  ResponseClassify<KotItemsResponseModal> itemsState =
      ResponseClassify<KotItemsResponseModal>.error("");
  ResponseClassify<KotItemsResponseModal> get itemStateResponse => itemsState;
  getItems() async {
    itemsState = ResponseClassify.loading();
    notifyListeners();
    try {
      itemsState =
          ResponseClassify.completed(await kotItemsUseCase.call(NoParams()));
      itemList.clear();
      itemList.addAll(itemsState.data!.data);
      notifyListeners();
      Get.toNamed(AppPages.kotpage);
    } catch (e) {
      itemsState = ResponseClassify.error("$e");
      notifyListeners();
    }
    notifyListeners();
  }

  String selectedMainGroup = "LIQUOR";
  bool issubItemLoading = false;
  bool issubItemLoading2 = false;
  final subitmsList = <ItemsDatum>[];
  List<SubGroup> filteredSubItemsList = [];

  void fiteredSubITems(String mainGroup) {
    debugPrint("============filtered sub item print started===========");
    filteredSubItemsList.clear();
    issubItemLoading = true;
    print("is sub loading in fn starting==${issubItemLoading}");
    debugPrint("item list  ==${itemList}");
    debugPrint("item list length==${itemList.length}");
    issubItemLoading2 = true;
    subitmsList.clear();
    subitmsList.addAll(itemList
        .where((element) => element.mainGroup.name == mainGroup)
        .toList());
    debugPrint("subitemlist ==$subitmsList");
    debugPrint("subitemlist length ==${subitmsList.length}");
    Set<SubGroup> uniqueSubGroups = subitmsList.map((e) => e.subGroup).toSet();
    debugPrint("uniqueSubGroups ==$uniqueSubGroups");
    debugPrint("uniqueSubGroups length==${uniqueSubGroups.length}");
    Set<SubGroup> encounteredSubGroups = {};
    for (var i in uniqueSubGroups) {
      debugPrint("Checking for subgroup: $i");
      if (!encounteredSubGroups.contains(i)) {
        filteredItemsList.clear();
        filteredSubItemsList.add(i);
        encounteredSubGroups.clear();
        encounteredSubGroups.add(i);
      }
      // var itemsForSubGroup = subitmsList
      //     .where((item) => item.subGroup.toString() == i.toString())
      //     .toList();
      // debugPrint("Found ${itemsForSubGroup.length} items for subgroup: $i");
      //filteredSubItemsList.addAll(itemsForSubGroup);
    }
    debugPrint("encountered subgroups==${encounteredSubGroups}");
    debugPrint("encountered subgroups length ==${encounteredSubGroups.length}");
    issubItemLoading2 = false;
    notifyListeners();
    debugPrint("sub list fn==${filteredSubItemsList}");
    // debugPrint("sub list first item${filteredSubItemsList.first.itemName}");
    // debugPrint("sub list fn lenth==${filteredSubItemsList.length}");
    issubItemLoading = false;
    notifyListeners();
    print("is sub loading in fn end==${issubItemLoading}");
    debugPrint("============filtered sub item print ended===========");
  }

  String selectedSubgroup = "";
  bool isItemLoading = false;
  bool isItemLoading2 = false;
  var filteredItemsList = <ItemsDatum>[];

  void filteredItems(String subGroup) {
    debugPrint("============filtered  item print started===========");
    debugPrint("subgroup name in item fn ==${subGroup}");
    debugPrint("selected sub group in fn ==${selectedSubgroup}");
    isItemLoading = true;
    filteredItemsList.clear();
    isItemLoading2 = true;
    filteredItemsList.addAll(itemList
        .where((element) => element.subGroup.name == subGroup)
        .toList());
    filteredSearchItemslist.clear();
    filteredSearchItemslist.addAll(filteredItemsList);
    debugPrint("item list ==$filteredItemsList");
    isItemLoading = false;
    isItemLoading2 = false;
    notifyListeners();
    debugPrint("============filtered  item print ended===========");
  }

  final searchcontroller = TextEditingController();
  final filteredSearchItemslist = <ItemsDatum>[];
  void fiterItemsInSearch(String query) {
    filteredSearchItemslist.clear();
    filteredSearchItemslist.addAll(filteredItemsList);
    List<ItemsDatum> temp = filteredSearchItemslist
        .where((element) =>
            (element.itemName.toLowerCase().contains(query) == true))
        .toList();
    filteredSearchItemslist.clear();
    filteredSearchItemslist.addAll(temp);
    notifyListeners();
  }
}
