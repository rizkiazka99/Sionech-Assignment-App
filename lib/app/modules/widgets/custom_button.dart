import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sionech_assignment_app/app/utils/colors.dart';
import 'package:sionech_assignment_app/app/utils/theme.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  IconData? icon;
  double? width;
  Color? color;
  Color? textColor;

  CustomButton({
    super.key, 
    required this.onTap, 
    required this.text, 
    this.icon,
    this.width,
    this.color,
    this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color ?? AppColors.primaryColor,
          boxShadow: MyTheme.boxShadows
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null 
                ? Icon(
                    icon,
                    color: textColor ?? Colors.white,
                  )
                : const SizedBox.shrink(),
            icon != null 
                ? SizedBox(width: 8.w)
                : const SizedBox.shrink(),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: textColor ?? Colors.white)
            )
          ]
        )
      )
    );
  }
}