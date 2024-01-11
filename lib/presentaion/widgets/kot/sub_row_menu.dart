import 'package:flutter/material.dart';
import 'package:ko/data/remote/modals/response/kotItemsResponseModal.dart';
import 'package:ko/presentaion/manager/controller/kotandbot/kot_provider.dart';
import 'package:ko/presentaion/themes/appcolors.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/kotandBot/sub_categoryModal.dart';

class SubCategoryRowMenu extends StatefulWidget {
  const SubCategoryRowMenu({super.key});

  @override
  State<SubCategoryRowMenu> createState() => _SubCategoryRowMenu();
}

class _SubCategoryRowMenu extends State<SubCategoryRowMenu> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final kotcontroller = Provider.of<KotProvider>(context);
    return SizedBox(
      height: height * 0.05,
      width: width,
      child: Consumer<KotProvider>(
        builder: (context, value, child) => kotcontroller.issubItemLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: kotcontroller.filteredSubItemsList.length,
                itemBuilder: (context, index) {
                  return MainCategoryItems(
                      index: index,
                      itemsdataum: kotcontroller.filteredSubItemsList[index]);
                },
              ),
      ),
    );
  }
}

class MainCategoryItems extends StatelessWidget {
  const MainCategoryItems(
      {super.key, required this.itemsdataum, required this.index});
  final SubGroup itemsdataum;
  final int index;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final kotcontroller = Provider.of<KotProvider>(context);
    return Consumer<KotProvider>(
      builder: (context, value, child) => GestureDetector(
        onTap: () {
          kotcontroller.selectedSubCategory(index);

          kotcontroller.selectedSubgroup = itemsdataum.name;
          kotcontroller.searchcontroller.clear();
          debugPrint("sub id in bubble =${kotcontroller.selectedSubgroup}");
          kotcontroller.filteredItems(itemsdataum.name);
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Container(
            height: height * 0.1,
            width: width * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kotcontroller.selectedSubCategoryIndex == index
                  ? AppColors.maincolor
                  : const Color.fromARGB(255, 255, 255, 255),
              border: Border.all(
                  color: kotcontroller.selectedSubCategoryIndex == index
                      ? AppColors.maincolor
                      : AppColors.grey),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Center(
                child: Text(
                  itemsdataum.name,
                  style: TextStyle(
                      color: kotcontroller.selectedSubCategoryIndex == index
                          ? AppColors.white
                          : AppColors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
