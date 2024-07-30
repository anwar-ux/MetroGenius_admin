import 'package:flutter/material.dart';
import 'package:metrogenius_admin/src/widgets/all_subcategory.dart';

class SubCategory extends StatelessWidget {
  final String categoryId;
  const SubCategory({super.key,required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Sub Category'),
        ),
        body: SubCategoryGrid(
          action: () {},
          icon: Icons.add, categoryId: categoryId,
        ));
  }
}
