import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sionech_assignment_app/app/domain/entities/movies_entity.dart';

@immutable
abstract class MoviesState extends Equatable {}

class MoviesLoadingState extends MoviesState {
  @override
  List<Object?> get props => [];
}

class MoviesLoadedState extends MoviesState {
  final List<MoviesEntity> movies;

  MoviesLoadedState({ required this.movies });

  @override
  List<Object?> get props => [movies];
}

class MoviesErrorState extends MoviesState {
  final String error;

  MoviesErrorState({ required this.error });

  @override
  List<Object?> get props => [error];
}