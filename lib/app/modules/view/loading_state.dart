import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sionech_assignment_app/app/utils/colors.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        //vertical: 12.h
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 8.h,
        mainAxisSpacing: 4.w
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        return Center(
          child: SpinKitHourGlass(
            color: AppColors.primaryColor,
            size: 18.sp,
          ),
        );
      }
    );
  }
}