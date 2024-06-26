import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sihaty_app/core/utils/colors.dart';
import 'package:sihaty_app/core/utils/txt_styal.dart';

class CustomTextFormFieldDoctor extends StatelessWidget {
  const CustomTextFormFieldDoctor({
    super.key,
    required this.titleText,
    required this.hintText,
    this.controller,
    this.maxLines, this.widget,
  });
  final String titleText;
  final String hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titleText),
        const Gap(5),
        TextFormField(
          maxLines: maxLines ?? 1,
          controller: controller,
          decoration: InputDecoration(
            hintStyle: getSmallStyle(context, color: AppColors.greyColor),
            hintText: hintText,
            suffixIcon: widget??const SizedBox(),
          ),
        ),
      ],
    );
  }
}