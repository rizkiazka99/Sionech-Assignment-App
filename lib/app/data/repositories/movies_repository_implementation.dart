import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sionech_assignment_app/app/data/model/movies_response_model.dart';
import 'package:sionech_assignment_app/app/domain/entities/movies_response_entity.dart';
import 'package:sionech_assignment_app/app/domain/repositories/movies_repository.dart';
import 'package:sionech_assignment_app/app/utils/dio.dart';
import 'package:sionech_assignment_app/app/utils/result.dart';

class MoviesRepositoryImplementation extends MoviesRepository {
  final _dio = DioHelper.init();

  @override
  Future<Result<MoviesResponseEntity>> getMovies() async {
    String endpoint = 
        '/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc';

    try {
      final response = await _dio.get(endpoint);
      final movies = MoviesResponseModel.fromJson(response.data);

      return Result.success(movies);
    } on DioException catch(err) {
      debugPrint(err.message);
      return Result.error(
        message: err.response?.data['message'] ?? 'Something went wrong',
        code: err.response?.statusCode ?? -1
      );
    } catch(err) {
      debugPrint(err.toString());
      return Result.error(message: 'Unexpected error occurred');
    }
  }
}