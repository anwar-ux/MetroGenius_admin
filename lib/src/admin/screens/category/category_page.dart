import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrogenius_admin/animation/route_animation.dart';
import 'package:metrogenius_admin/src/admin/screens/category/add_category.dart';
import 'package:metrogenius_admin/src/widgets/all_services_grid.dart';


class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Category'),
      //   centerTitle: true,
      //   automaticallyImplyLeading: false,
       
      // ),
      body: CustomScrollView(
        slivers: [AllServicesGrid(icon: Icons.add,action: () {
                Navigator.of(context).push(createRoute(AddCategory()));
              } ,)],
      ),
    );
  }
}
