import 'package:sionech_assignment_app/app/data/repositories/movies_repository_implementation.dart';
import 'package:sionech_assignment_app/app/domain/entities/movies_response_entity.dart';
import 'package:sionech_assignment_app/app/domain/usecase/movies_use_case.dart';
import 'package:sionech_assignment_app/app/modules/bloc/movies_events.dart';
import 'package:sionech_assignment_app/app/modules/bloc/movies_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sionech_assignment_app/app/utils/result.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesLoadingState()) {
    on<LoadMoviesEvent>((event, emit) async {
      emit(MoviesLoadingState());

      try {
        late MoviesUseCase movies;
        late Result<MoviesResponseEntity> result;

        movies = MoviesUseCase(moviesRepository: MoviesRepositoryImplementation());
        result = await movies.call();

        if (result.status is Success) {
          emit(MoviesLoadedState(movies: result.data.results));
        } else {
          emit(MoviesErrorState(error: result.message));
        }
      } catch(err) {
        emit(MoviesErrorState(error: err.toString()));
      }
    });
  } 
}