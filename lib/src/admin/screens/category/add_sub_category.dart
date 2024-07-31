// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrogenius_admin/functions/image_convertion.dart';
import 'package:metrogenius_admin/src/admin/screens/category/bloc/addsubcategory/add_sub_category_bloc.dart';
import 'package:metrogenius_admin/src/widgets/custom_button.dart';
import 'package:metrogenius_admin/src/widgets/custom_textfield.dart';
import 'package:metrogenius_admin/utils/constants.dart';
import 'package:metrogenius_admin/utils/validations.dart';

class AddSubCategory extends StatelessWidget {
  final String categoryId;
  AddSubCategory({super.key, required this.categoryId});
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? img;

  @override
  Widget build(BuildContext context) {
    final checkboxes = {'Consultation': false, 'Installation': false, 'Repiar and Maint': false};
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add subcategory'),
        backgroundColor: Colors.transparent,
      ),
      body: BlocConsumer<AddSubCategoryBloc, AddSubCategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(50),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final image = await ImageConvertion.pickImageWeb();
                      if (image != null) {
                        context.read<AddSubCategoryBloc>().add(ImageChanged(image));
                        img = image;
                      }
                    },
                    child: CircleAvatar(
                      backgroundImage: img != null ? MemoryImage(base64Decode(img!)) : null,
                      radius: 60,
                      child: img == null
                          ? const Center(
                              child: Icon(Icons.image),
                            )
                          : null,
                    ),
                  ),
                  Constants.spaceHight20,
                  CustomTextfield(
                    hint: 'Name',
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    validator: Validations.name,
                    onChanged: (value) => context.read<AddSubCategoryBloc>().add(NameChanged(value)),
                  ),
                  Constants.spaceHight10,
                  CustomTextfield(
                    hint: 'Price',
                    onChanged: (value) => context.read<AddSubCategoryBloc>().add(PriceChanged(int.parse(value))),
                    keyboardType: TextInputType.number,
                    controller: priceController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a value';
                      }
                      return null;
                    },
                  ),
                  Constants.spaceHight10,
                  CustomTextfield(
                    hint: 'Description',
                    onChanged: (value) => context.read<AddSubCategoryBloc>().add(DiscriptionChanged(value)),
                    keyboardType: TextInputType.none,
                    controller: discriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a description';
                      }
                      return null;
                    },
                  ),
                  Constants.spaceHight20,
                  Column(
                    children: checkboxes.keys.map((key) {
                      return CheckboxListTile(
                        title: Text(key),
                        value: state.checkboxes[key] ?? false,
                        onChanged: (bool? value) {
                          context.read<AddSubCategoryBloc>().add(CheckboxChanged(key, value ?? false));
                        },
                      );
                    }).toList(),
                  ),
                  Constants.spaceHight20,
                  CustomButton(
                    title: 'Upload',
                    action: () async {
                      if (_formKey.currentState!.validate()) {
                        if (img != null) {
                          final imageurl = await ImageConvertion.uploadImageToFirebase(img!);
                          context.read<AddSubCategoryBloc>().add(ImageChanged(imageurl!));
                        }
                        context.read<AddSubCategoryBloc>().add(FormSubmit(categoryId));
                        Navigator.of(context).pop();
                      }
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
