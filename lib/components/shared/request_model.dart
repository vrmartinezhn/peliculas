// To parse this JSON data, do
//
//     final requestModel = requestModelFromJson(jsonString);

import 'dart:convert';

RequestModel requestModelFromJson(String str) =>
    RequestModel.fromJson(json.decode(str));

String requestModelToJson(RequestModel data) => json.encode(data.toJson());

class RequestModel {
  final int page;
  final List<dynamic> results; // tipo dynamic
  final int totalPages;
  final int totalResults;

  RequestModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
    page: json["page"] ?? 0,
    results: List<dynamic>.from(json["results"] ?? json["cast"] ?? []),
    totalPages: json["total_pages"] ?? 0,
    totalResults: json["total_results"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

enum OriginalLanguage { EN, ES, KO, NL }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "es": OriginalLanguage.ES,
  "ko": OriginalLanguage.KO,
  "nl": OriginalLanguage.NL,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
