import 'dart:convert';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class MovieModel {
  final String id;
  final String title;
  final String description;
  final String posterUrl;

  MovieModel({
    required this.id,
    required this.title,
    required this.description,
    required this.posterUrl,
  });

  factory MovieModel.fromMap(Map<String, dynamic> json) => MovieModel(
        id: json["id"] ?? json["_id"] ?? '',
        title: json["Title"] ?? json["title"] ?? '',
        description: json["Plot"] ?? json["description"] ?? '',
        posterUrl:
            (json["Poster"] ?? json["posterUrl"] ?? '').toString().withHttps,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "posterUrl": posterUrl,
      };

  factory MovieModel.fromJson(String str) =>
      MovieModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  MovieModel copyWith({
    String? id,
    String? title,
    String? description,
    String? posterUrl,
  }) =>
      MovieModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        posterUrl: posterUrl?.toString().withHttps ?? this.posterUrl,
      );

  @override
  String toString() {
    return 'MovieModel(id: $id, title: $title, description: $description, posterUrl: $posterUrl)';
  }
}
