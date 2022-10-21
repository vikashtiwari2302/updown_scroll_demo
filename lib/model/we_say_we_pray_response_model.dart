// To parse this JSON data, do
//
//     final weSayWePrayResponseModel = weSayWePrayResponseModelFromJson(jsonString);

import 'dart:convert';

List<WeSayWePrayResponseModel> weSayWePrayResponseModelFromJson(String str) =>
    List<WeSayWePrayResponseModel>.from(
        json.decode(str).map((x) => WeSayWePrayResponseModel.fromJson(x)));

String weSayWePrayResponseModelToJson(List<WeSayWePrayResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WeSayWePrayResponseModel {
  WeSayWePrayResponseModel({
    this.id,
    this.book,
    this.chap,
    this.subchap,
    this.weSay,
    this.wePray,
    this.isWeSaySelected=false,
    this.isWePraySelected=false,
  });

  String? id;
  String? book;
  Chap? chap;
  String? subchap;
  bool isWeSaySelected;
  bool isWePraySelected;
  List<String>? weSay;
  List<String>? wePray;

  factory WeSayWePrayResponseModel.fromJson(Map<String, dynamic> json) =>
      WeSayWePrayResponseModel(
        id: json['ID'],
        book: json['book'],
        chap: chapValues.map![json['chap']],
        subchap: json['subchap'],
        weSay: List<String>.from(json['WeSay'].map((x) => x)),
        wePray: List<String>.from(json['WePray'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "book": book,
        "chap": chapValues.reverse![chap],
        "subchap": subchap,
        "WeSay": List<dynamic>.from(weSay!.map((x) => x)),
        "WePray": List<dynamic>.from(wePray!.map((x) => x)),
      };
}

enum Chap { BLESSINGS }

final chapValues = EnumValues({"Blessings": Chap.BLESSINGS});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}


