import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ko/data/remote/modals/response/kotItemsResponseModal.dart';
import 'package:ko/presentaion/manager/controller/kotandbot/kot_provider.dart';
import 'package:provider/provider.dart';
import '../../routes/app_pages.dart';
import '../../themes/appcolors.dart';

class SubCategoryWidget extends StatefulWidget {
  const SubCategoryWidget({super.key});

  @override
  State<SubCategoryWidget> createState() => _SubCategoryWidgetState();
}

class _SubCategoryWidgetState extends State<SubCategoryWidget> {
  late KotProvider subcategorycontroller;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      subcategorycontroller = Provider.of<KotProvider>(context, listen: false);
      subcategorycontroller.fiteredSubITems("LIQUOR");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<KotProvider>(
      builder: (context, value, child) {
        if (subcategorycontroller.isSelectedMainLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            key: UniqueKey(),
            itemCount: subcategorycontroller.filteredSubItemsList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 110),
            itemBuilder: (context, index) {
              return Consumer<KotProvider>(
                builder: (context, value, child) =>
                    subcategorycontroller.issubItemLoading2
                        ? const SizedBox.shrink()
                        : SubCategoryItem(
                            slectedsubindex: index,
                            modal: subcategorycontroller
                                .filteredSubItemsList[index],
                          ),
              );
            },
          );
        }
      },
    );
  }
}

class SubCategoryItem extends StatelessWidget {
  const SubCategoryItem(
      {super.key, required this.modal, required this.slectedsubindex});
  final SubGroup modal;
  final int slectedsubindex;
  @override
  Widget build(BuildContext context) {
    final subcategorycontroller = Provider.of<KotProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 10, 22, 25),
      child: InkWell(
        onTap: () {
          subcategorycontroller.selectedSubCategory(slectedsubindex);
          // subcategorycontroller.selectedSubID = 1;
          // subcategorycontroller.selectedMainGroup = modal.mainGroup.name;
          debugPrint(
              "subid in otap =${subcategorycontroller.selectedSubgroup}");
          debugPrint(
              "mainid in ontap==${subcategorycontroller.selectedMainGroup}");
          subcategorycontroller.filteredItems(
            modal.name,
          );
          debugPrint(
              "mainid in ontap after execution of filtereItems fn==${subcategorycontroller.selectedMainGroup}");
          debugPrint(
              "subid in ontap after execution of filtereItems fn==${subcategorycontroller.selectedSubgroup}");
          // subcategorycontroller.selectedSubID = modal.;
          debugPrint(
              "subid in ontap after assigning==${subcategorycontroller.selectedSubgroup}");
          Get.toNamed(AppPages.itempage);
        },
        child: SizedBox(
          height: height * 0.01,
          width: width * 0.3,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: height * 0.13,
                //   child: Padding(
                //     padding: const EdgeInsets.fromLTRB(18, 10, 18, 10),
                //     child: Container(
                //       decoration: BoxDecoration(
                //           image: DecorationImage(
                //               image: AssetImage(AppAssets.biriyani),
                //               fit: BoxFit.fill),
                //           borderRadius: const BorderRadius.only(
                //               topLeft: Radius.circular(20),
                //               topRight: Radius.circular(20),
                //               bottomLeft: Radius.circular(20),
                //               bottomRight: Radius.circular(20))),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                Text(
                  modal.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
