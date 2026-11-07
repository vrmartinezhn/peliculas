// To parse this JSON data, do
//
//     final consejosResponse = consejosResponseFromJson(jsonString);

import 'dart:convert';

ConsejosResponse consejosResponseFromJson(String str) => ConsejosResponse.fromJson(json.decode(str));

String consejosResponseToJson(ConsejosResponse data) => json.encode(data.toJson());

class ConsejosResponse {
    final ConsejosModel slip;

    ConsejosResponse({
        required this.slip,
    });

    factory ConsejosResponse.fromJson(Map<String, dynamic> json) => ConsejosResponse(
        slip: ConsejosModel.fromJson(json["slip"]),
    );

    Map<String, dynamic> toJson() => {
        "slip": slip.toJson(),
    };
}

class ConsejosModel {
    final int id;
    final String advice;

    ConsejosModel({
        required this.id,
        required this.advice,
    });

    factory ConsejosModel.fromJson(Map<String, dynamic> json) => ConsejosModel(
        id: json["id"],
        advice: json["advice"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "advice": advice,
    };
}
