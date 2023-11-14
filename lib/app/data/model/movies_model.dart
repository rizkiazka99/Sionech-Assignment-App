import 'package:sionech_assignment_app/app/domain/entities/movies_entity.dart';

class MoviesModel extends MoviesEntity {
  MoviesModel.fromJson(Map<String, dynamic> json)
      : super(
          adult: json["adult"],
          backdropPath: json["backdrop_path"],
          genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
          id: json["id"],
          originalLanguage: json["original_language"],
          originalTitle: json["original_title"],
          overview: json["overview"],
          popularity: json["popularity"]?.toDouble(),
          posterPath: json["poster_path"],
          releaseDate: DateTime.parse(json["release_date"]),
          title: json["title"],
          video: json["video"],
          voteAverage: json["vote_average"]?.toDouble(),
          voteCount: json["vote_count"],
        );
}