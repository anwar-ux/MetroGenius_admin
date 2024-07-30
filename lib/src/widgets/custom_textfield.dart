import 'package:flutter/material.dart';
import 'package:metrogenius_admin/utils/colors.dart';
import 'package:metrogenius_admin/utils/constants.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.hint,
    this.suffix,
    this.validator,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.head,
    this.onTapSuffix,
    this.obscureText,
    this.readOnly,
   required this.keyboardType
  });

  final String hint;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final String? head;
  final VoidCallback? onTapSuffix;
  final bool? obscureText;
  final bool? readOnly;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (head != null) ...[
          Text(
            head!,
            // ignore: prefer_const_constructors
            style: TextStyle(
              color: AppColors.seconderyColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Constants.spaceHight10,
        ],
        TextFormField(
          keyboardType:keyboardType ,
          focusNode: focusNode,
          readOnly:readOnly??false ,
          onChanged: onChanged,
          controller: controller,
          obscureText: obscureText??false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 214, 214, 214),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 214, 214, 214),
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 214, 214, 214),
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 214, 214, 214),
              ),
            ),
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 214, 214, 214),
              ),
            ),
            fillColor: AppColors.primaryColor,
            filled: true,
            suffixIcon: suffix != null
                ? GestureDetector(
                    onTap: onTapSuffix,
                    child: suffix,
                  )
                : null,
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w100,
              color: Colors.grey.shade500,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.none,
                width: 0.2,
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
