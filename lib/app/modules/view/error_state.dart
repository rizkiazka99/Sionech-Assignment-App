import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sionech_assignment_app/app/modules/widgets/custom_button.dart';
import 'package:sionech_assignment_app/app/utils/constants.dart';

class ErrorState extends StatelessWidget {
  final String message;
  final void Function()? reload;

  const ErrorState({
    super.key, 
    required this.message,
    required this.reload
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          errorAsset,
          width: 250.w,
          height: 250.h,
        ),
        SizedBox(height: 12.h),
        Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 12.h),
        CustomButton(
          onTap: reload,
          width: MediaQuery.of(context).size.width / 3, 
          text: 'Reload',
          icon: Icons.refresh,
        )
      ]
    );
  }
}