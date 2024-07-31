import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrogenius_admin/animation/route_animation.dart';
import 'package:metrogenius_admin/src/admin/screens/category/add_sub_category.dart';
import 'package:metrogenius_admin/src/admin/screens/category/bloc/getsubcategory/get_sub_category_bloc.dart';
import 'package:metrogenius_admin/src/widgets/snak_bar.dart';
import 'package:metrogenius_admin/utils/colors.dart';
import 'package:metrogenius_admin/utils/constants.dart';

class SubCategoryGrid extends StatelessWidget {
  final IconData? icon;
  final VoidCallback action;
  final String categoryId;

  const SubCategoryGrid({
    Key? key,
    this.icon,
    required this.action,
    required this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetSubCategoryBloc()..add(FetchSubCategoryData(categoryId)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocConsumer<GetSubCategoryBloc, GetSubCategoryState>(
          listener: (context, state) {
            if (state is GetSubCategoryFailed) {
              showCustomSnackbar(context, 'Failed', state.errorMsg, Colors.red);
            }
          },
          builder: (context, state) {
            if (state is GetSubCategoryLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetSubCategoryLoaded) {
              final itemCount = state.data.length + 1;

              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 480,
                  mainAxisExtent: 200,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  if (index == itemCount - 1) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(createRoute(
                        AddSubCategory(categoryId: categoryId),
                      )),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.lightGrey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(icon, color: Colors.blue),
                            const SizedBox(height: 8),
                            const Text('ADD SUBCATEGORY'),
                          ],
                        ),
                      ),
                    );
                  } else {
                    final doc = state.data[index];
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        return GestureDetector(
                          onTap: () {
                           
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.seconderyColor,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.lightGrey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              border: Border.all(color: AppColors.seconderyColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            doc['Name'],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                          Constants.spaceHight15,
                                          const Text(
                                            'Price starts from',
                                            style: TextStyle(letterSpacing: 1, fontSize: 12),
                                          ),
                                          Constants.spaceHight5,
                                          Text(
                                            '₹ ${doc['Price'].toString()}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: constraints.maxHeight * 0.4,
                                        width: constraints.maxWidth * 0.55,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.network(doc['Image'], fit: BoxFit.cover),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Discription',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Constants.spaceHight5,
                                      Text(
                                        doc['Discription'],
                                        style: const TextStyle(
                                          fontSize: 12,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
