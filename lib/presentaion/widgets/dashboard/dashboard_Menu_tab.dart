import 'package:flutter/material.dart';
import 'package:ko/domain/entities/dashboard/dashboard_Grid_Modal.dart';
import 'package:provider/provider.dart';
import '../../manager/controller/dashboard_provider.dart';
import '../../themes/appcolors.dart';

class DashboardMenuTab extends StatefulWidget {
  const DashboardMenuTab({super.key});

  @override
  State<DashboardMenuTab> createState() => _DashboardMenuTabState();
}

class _DashboardMenuTabState extends State<DashboardMenuTab> {
  @override
  Widget build(BuildContext context) {
    final dashboardController = Provider.of<DashBoardproivder>(context);
    return GridView.builder(
      shrinkWrap: true,
      itemCount: dashboardController.dashboarditems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 250, crossAxisCount: 2),
      itemBuilder: (context, index) {
        return DashboardGridviewTab(
            modal: dashboardController.dashboarditems[index]);
      },
    );
  }
}

class DashboardGridviewTab extends StatelessWidget {
  const DashboardGridviewTab({super.key, required this.modal});

  final DashBoardGridModal modal;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: () {
          modal.ontap();
        },
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: height * 0.1,
                width: width * 0.25,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey.shade400,
                      offset: const Offset(-3, 3),
                    )
                  ],
                  borderRadius: BorderRadius.circular(25),
                ),
                alignment: Alignment.center,
                child: Icon(
                  modal.icon,
                  size: 45,
                  color: AppColors.red,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Text(
                  modal.name,
                  style: TextStyle(
                    fontSize: height * 0.015,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              )
            ],
          ),
        ));
  }
}
