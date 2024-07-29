import 'package:flutter/material.dart';
import 'package:metrogenius_admin/animation/route_animation.dart';
import 'package:metrogenius_admin/src/admin/screens/home/application/applications_page.dart';
import 'package:metrogenius_admin/utils/colors.dart';
import 'package:metrogenius_admin/utils/constants.dart';


class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Welcome back admin',style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 1),),
            const Text('Glad to see you again!',style: TextStyle(letterSpacing: 1,fontSize: 12),),
          ],
        ),
        
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GridContainer(
                  title: 'Applications',
                  icon: Icons.format_align_justify_outlined,
                  action: () => Navigator.of(context).push(createRoute(const ApplicationsPage())),
                ),
                GridContainer(
                  icon: Icons.insights,
                  title: 'Insights',
                ),
                GridContainer(
                  icon: Icons.payments_sharp,
                  title: 'Payments',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class GridContainer extends StatelessWidget {
  GridContainer({
    required this.title,
    required this.icon,
    this.action,
    super.key,
  });
  String title;
  IconData icon;
  void Function()? action;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:action ,
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width * 0.26,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lightGrey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              Constants.spaceHight15,
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
