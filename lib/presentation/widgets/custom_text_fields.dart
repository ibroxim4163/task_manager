import 'package:flutter/material.dart';

import '../../../data/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final double height;
  final Widget? suffix;
  final Widget? prefix;
  final bool? enabled;
  final double width;
  final bool? readOnly;
  final bool? autofocus;
  final void Function()? onTap;
  final String? Function(String? value)? validator;
  const CustomTextField({
    required this.hintText,
    this.controller,
    this.height = 50,
    this.prefix,
    this.width = double.infinity,
    this.onTap,
    this.validator,
    this.readOnly,
    this.autofocus,
    this.enabled,
    this.suffix,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const unErrorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: AppColors.borderSideColor,
        width: 2,
      ),
    );
    const errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: AppColors.redColor,
        width: 2,
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: height,
        width: width,
        child: Theme(
          data: ThemeData(
            disabledColor: AppColors.blackColor,
          ),
          child: TextFormField(
            autofocus: autofocus ?? false,
            validator: validator,
            readOnly: readOnly ?? false,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            onTap: onTap,
            controller: controller,
            decoration: InputDecoration(
              prefix: SizedBox(width: prefix != null ? 20 : 10),
              contentPadding: EdgeInsets.only(left: prefix != null ? 50 : 1),
              hintText: hintText,
              suffixIcon: suffix,
              prefixIcon: prefix,
              hintStyle: const TextStyle(
                fontSize: 15,
                color: AppColors.hintTextColor,
              ),
              focusedBorder: unErrorBorder,
              enabled: enabled ?? true,
              enabledBorder: unErrorBorder,
              disabledBorder: unErrorBorder,
              errorBorder: errorBorder,
              focusedErrorBorder: errorBorder,
            ),
            cursorColor: AppColors.blackColor,
            cursorWidth: 2,
          ),
        ),
      ),
    );
  }
}
