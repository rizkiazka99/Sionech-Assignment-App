import 'package:sionech_assignment_app/app/data/model/movies_model.dart';
import 'package:sionech_assignment_app/app/domain/entities/movies_entity.dart';
import 'package:sionech_assignment_app/app/domain/entities/movies_response_entity.dart';

class MoviesResponseModel extends MoviesResponseEntity {
  MoviesResponseModel.fromJson(Map<String, dynamic> json)
      : super(
          page: json["page"],
          results: List<MoviesEntity>.from(json["results"].map((x) => MoviesModel.fromJson(x))),
          totalPages: json["total_pages"],
          totalResults: json["total_results"],
        );
}