import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sionech_assignment_app/app/domain/entities/movies_entity.dart';
import 'package:sionech_assignment_app/app/modules/bloc/movies_bloc.dart';
import 'package:sionech_assignment_app/app/modules/bloc/movies_events.dart';
import 'package:sionech_assignment_app/app/modules/bloc/movies_states.dart';
import 'package:sionech_assignment_app/app/modules/view/error_state.dart';
import 'package:sionech_assignment_app/app/modules/view/loaded_state.dart';
import 'package:sionech_assignment_app/app/modules/view/loading_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MoviesBloc>(
          create: (BuildContext context) {
            return MoviesBloc();
          }
        )
      ], 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Assignment by Rizki Azka'),
        ),
        body: blocBody(),
      )
    );
  }

  Widget blocBody() {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: BlocProvider(
          create: (context) {
            return MoviesBloc()
                ..add(LoadMoviesEvent());
          },
          child: BlocBuilder<MoviesBloc, MoviesState>(
            builder: (context, state) {
              if (state is MoviesLoadingState) {
                return const LoadingState();
              }
        
              if (state is MoviesLoadedState) {
                List<MoviesEntity> movies = state.movies;
        
                return LoadedState(movies: movies);
              }
        
              if (state is MoviesErrorState) {
                return ErrorState(message: state.error);
              }
        
              return const SizedBox.shrink();
            }
          )
        ),
      ),
    );
  }
}