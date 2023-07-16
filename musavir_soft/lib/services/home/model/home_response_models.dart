import 'dart:convert';

List<dynamic> homeResponseModelFromJson(String str) => List<dynamic>.from(json
    .decode(str)["notes"]
    .map((x) => x)
    .map((x) => HomeResponseModel.fromJson(x)));

class HomeResponseModel {
  HomeResponseModel({
    required this.ornekId,
    required this.ornek01,
    required this.ornek02,
  });

  final String ornekId;
  final String ornek01;
  final String ornek02;

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeResponseModel(
        ornekId: json["ornekId"],
        ornek01: json["ornek01"],
        ornek02: json["ornek02"],
      );
}
