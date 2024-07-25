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
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.transparent,
      //   title:const Text('Welcome back admin'),
      //   centerTitle: true,
      //   actions: [
      //     Container(
      //       margin: const EdgeInsets.all(10.0),
      //       height: 45,
      //       width: 45,
      //       decoration: BoxDecoration(
      //         border: Border.all(
      //           color: Colors.grey,
      //         ),
      //         borderRadius: BorderRadius.circular(25),
      //       ),
      //       child: const Icon(
      //         Icons.notifications_active_outlined,
      //         color: AppColors.lightGrey,
      //       ),
      //     )
      //   ],
      // ),
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
                  icon: Icons.settings_input_composite_sharp,
                  title: '',
                ),
                GridContainer(
                  icon: Icons.settings_input_composite_sharp,
                  title: '',
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
