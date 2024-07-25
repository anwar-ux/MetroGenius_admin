// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrogenius_admin/functions/image_convertion.dart';
import 'package:metrogenius_admin/src/admin/screens/category/bloc/addcategory/category_bloc.dart';
import 'package:metrogenius_admin/src/widgets/custom_button.dart';
import 'package:metrogenius_admin/src/widgets/custom_textfield.dart';
import 'package:metrogenius_admin/utils/constants.dart';
import 'dart:typed_data';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;



// ignore: must_be_immutable
class AddCategory extends StatelessWidget {
  AddCategory({super.key});

  TextEditingController nameController = TextEditingController();
  String? img;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add category'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async {
                    final image = await ImageConvertion.pickImageWeb();
                    if (image != null) {
                     
                      context.read<CategoryBloc>().add(ImageChanged(image));
                      img = image;
                    }
                  },
                  child: CircleAvatar(
                    backgroundImage:
                        img != null ? MemoryImage(base64Decode(img!)) : null,
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
                  hint: 'Categoryname',
                  controller: nameController,
                  onChanged: (value) =>
                      context.read<CategoryBloc>().add(NameChanged(value)),
                ),
                Constants.spaceHight35,
                CustomButton(
                  title: 'Upload',
                  action: () async {
                    if (img != null) {
                      final downloadLink =
                          await ImageConvertion. uploadImageToFirebase(img!);
                      if (downloadLink != null) {
                        context
                            .read<CategoryBloc>()
                            .add(ImageChanged(downloadLink));
                      }
                      context.read<CategoryBloc>().add(FormSubmit());
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
