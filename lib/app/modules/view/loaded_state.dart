import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sionech_assignment_app/app/domain/entities/movies_entity.dart';
import 'package:sionech_assignment_app/app/utils/colors.dart';
import 'package:sionech_assignment_app/app/utils/constants.dart';

class LoadedState extends StatefulWidget {
  final List<MoviesEntity> movies;
  
  const LoadedState({
    super.key,
    required this.movies
  });

  @override
  State<LoadedState> createState() => _LoadedStateState();
}

class _LoadedStateState extends State<LoadedState> {
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
      itemCount: widget.movies.length,
      itemBuilder: (context, index) {
        return CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: basePosterUrl + widget.movies[index].posterPath,
          placeholder: (context, url) => SpinKitHourGlass(
            color: AppColors.primaryColor,
            size: 18.sp,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        );
      }
    );
  }
}