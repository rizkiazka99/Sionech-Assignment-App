import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
}

class LoadMoviesEvent extends MoviesEvent {
  @override
  List<Object?> get props => [];
}