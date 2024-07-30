import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrogenius_admin/animation/route_animation.dart';
import 'package:metrogenius_admin/src/admin/screens/category/bloc/getcategory/getcategory_bloc.dart';
import 'package:metrogenius_admin/src/admin/screens/category/sub_category.dart';
import 'package:metrogenius_admin/utils/colors.dart';

class AllServicesGrid extends StatelessWidget {
  AllServicesGrid({super.key, this.count, this.icon, this.action});
  int? count;
  IconData? icon;
  void Function()? action;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetcategoryBloc>().add(FetchCategoryData());
    });

    return SliverPadding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      sliver: BlocConsumer<GetcategoryBloc, GetcategoryState>(
        listener: (context, state) {
          if (state is GetCategoryFailed) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to load categories')));
          }
        },
        builder: (context, state) {
          final int itemCount = state is GetCategoryLoaded ? (count != null ? count! + 1 : state.data.length + 1) : 0;

          if (state is GetCategoryLoading) {
            return const SliverFillRemaining(child: Center(child: CircularProgressIndicator()));
          } else if (state is GetCategoryLoaded) {
            return SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                mainAxisExtent: 150,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == itemCount - 1 && icon != null) {
                    return GestureDetector(
                      onTap: action,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.lightGrey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(icon, color: Colors.blue), Text('ADD CATEGORY')],
                        ),
                      ),
                    );
                  } else {
                    if (index < state.data.length) {
                      final doc = state.data[index];
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(createRoute(SubCategory(categoryId:doc['Id'],))),
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
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CircleAvatar(radius: 40, backgroundImage: NetworkImage(doc['Image'])),
                                  ],
                                ),
                                Text(
                                  doc['Name'],
                                  style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  }
                },
                childCount: itemCount,
              ),
            );
          } else {
            return const SliverFillRemaining(child: Center(child: Text('Error loading services')));
          }
        },
      ),
    );
  }
}
