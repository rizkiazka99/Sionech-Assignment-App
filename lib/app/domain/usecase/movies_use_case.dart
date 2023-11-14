import 'package:sionech_assignment_app/app/domain/entities/movies_response_entity.dart';
import 'package:sionech_assignment_app/app/domain/repositories/movies_repository.dart';
import 'package:sionech_assignment_app/app/utils/result.dart';
import 'package:sionech_assignment_app/app/utils/use_case.dart';

class MoviesUseCase extends UseCase {
  final MoviesRepository moviesRepository;

  MoviesUseCase({ required this.moviesRepository });

  @override
  Future<Result<MoviesResponseEntity>> call() async {
    if (!await hasInternetConnection) {
      return Result.noInternet();
    } else {
      return moviesRepository.getMovies();
    }
  }
}