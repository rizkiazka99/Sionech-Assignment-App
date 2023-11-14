import 'package:sionech_assignment_app/app/domain/entities/movies_response_entity.dart';
import 'package:sionech_assignment_app/app/utils/result.dart';

abstract class MoviesRepository {
  Future<Result<MoviesResponseEntity>> getMovies();
}