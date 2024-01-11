import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:ko/domain/entities/dashboard/carousel_Modal.dart';
import 'package:ko/domain/entities/dashboard/dashboard_Grid_Modal.dart';
import 'package:ko/presentaion/manager/controller/kotandbot/memeber_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../routes/app_pages.dart';
import '../../themes/app_assets.dart';
import '../../themes/appcolors.dart';

class DashBoardproivder extends ChangeNotifier {
  late MemberGuestProvider memberGuestProvider;
  late List<DashBoardGridModal> dashboarditems;

  DashBoardproivder(this.memberGuestProvider) {
    dashboarditems = <DashBoardGridModal>[
      DashBoardGridModal(IcoFontIcons.foodCart, "KOT", AppColors.red, () {
        clear();
      }),
      DashBoardGridModal(
          MdiIcons.clipboardListOutline, "Billing", AppColors.blue, () {
        Get.toNamed(AppPages.billingpage);
      }),
      DashBoardGridModal(Icons.receipt, "Recharge", AppColors.green, () {}),
      DashBoardGridModal(
          MdiIcons.bookOutline, "Report", AppColors.orange, () {}),
    ];
  }

  //Carousel Slider
  final List<CarouselModel> carouselitems = [
    CarouselModel(AppAssets.caurosel1),
    CarouselModel(AppAssets.caurosel2),
    CarouselModel(AppAssets.caurosel3),
    CarouselModel(AppAssets.caurosel4),
  ];
  clear() {
    memberGuestProvider.waiterNameController = "";
    memberGuestProvider.balanceCntlr = "";
    memberGuestProvider.biocardNoTexteditingCntlr.clear();
    memberGuestProvider.isGuestSelected = false;
    memberGuestProvider.isMemberSelected = false;
    memberGuestProvider.memberNoTextedTexteditingCntlr.clear();
    memberGuestProvider.nameCntlr = "";
    memberGuestProvider.tablecontroller.clear();
    memberGuestProvider.remarkcontroller.clear();
    memberGuestProvider.counterList.clear();
    memberGuestProvider.waiterList.clear();
    memberGuestProvider.remarkcontroller.clear();
    memberGuestProvider.waiterNameController = "";
    notifyListeners();
    Get.toNamed(AppPages.memeberGuestPage);
  }
}
