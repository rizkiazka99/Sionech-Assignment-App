import 'package:sionech_assignment_app/app/domain/entities/movies_entity.dart';

class MoviesResponseEntity {
  int page;
  List<MoviesEntity> results;
  int totalPages;
  int totalResults;

  MoviesResponseEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}