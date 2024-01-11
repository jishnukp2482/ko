import 'package:flutter/material.dart';
import 'package:ko/presentaion/manager/controller/kotandbot/kot_provider.dart';
import 'package:ko/presentaion/themes/appcolors.dart';

import 'package:provider/provider.dart';

import '../../../domain/entities/kotandBot/mainCategoryModal.dart';

class MainCategoryMenu extends StatefulWidget {
  const MainCategoryMenu({super.key});

  @override
  State<MainCategoryMenu> createState() => _MainCategoryMenuState();
}

class _MainCategoryMenuState extends State<MainCategoryMenu> {
  @override
  Widget build(BuildContext context) {
    final kotcontroller = Provider.of<KotProvider>(context, listen: false);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.05,
      width: width,
      child: Consumer<KotProvider>(
        builder: (context, value, child) => kotcontroller.isSelectedMainLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: kotcontroller.mainCategory.length,
                itemBuilder: (context, index) {
                  return MainCategoryItems(
                      slectedindex: index,
                      koTcategoryModal: kotcontroller.mainCategory[index]);
                },
              ),
      ),
    );
  }
}

class MainCategoryItems extends StatelessWidget {
  const MainCategoryItems(
      {super.key, required this.koTcategoryModal, required this.slectedindex});
  final KOTcategoryModal koTcategoryModal;
  final int slectedindex;
  @override
  Widget build(BuildContext context) {
    final kotcontroller = Provider.of<KotProvider>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Consumer<KotProvider>(
      builder: (context, value, child) => GestureDetector(
        onTap: () {
          kotcontroller.selectedMainGroup = koTcategoryModal.category;
          debugPrint(
              "selected main group ==${kotcontroller.selectedMainGroup}");
          debugPrint("selected index of main ==${slectedindex}");
          debugPrint("selected index of Main category==${koTcategoryModal.id}");
          kotcontroller.selectedMaincategory(
              slectedindex, kotcontroller.selectedMainGroup.toString());
          print("main id =${kotcontroller.selectedMainGroup}");
          kotcontroller
              .fiteredSubITems(kotcontroller.selectedMainGroup.toString());
          print("is sub loading in page==${kotcontroller.issubItemLoading}");
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Container(
            height: height * 0.1,
            width: width * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:
                  kotcontroller.selectedMainCategoryIndex == koTcategoryModal.id
                      ? AppColors.maincolor
                      : const Color.fromARGB(255, 255, 255, 255),
              border: Border.all(
                  color: kotcontroller.selectedMainCategoryIndex ==
                          koTcategoryModal.id
                      ? AppColors.maincolor
                      : AppColors.grey),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      koTcategoryModal.icon,
                      height: height * 0.04,
                      width: width * 0.05,
                      color: kotcontroller.selectedMainCategoryIndex ==
                              koTcategoryModal.id
                          ? AppColors.white
                          : AppColors.black,
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Text(
                      koTcategoryModal.category,
                      style: TextStyle(
                          color: kotcontroller.selectedMainCategoryIndex ==
                                  koTcategoryModal.id
                              ? AppColors.white
                              : AppColors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
