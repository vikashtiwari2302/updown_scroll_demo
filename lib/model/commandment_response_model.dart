// To parse this JSON data, do
//
//     final commandmentResponseModel = commandmentResponseModelFromJson(jsonString);

import 'dart:convert';

List<CommandmentResponseModel> commandmentResponseModelFromJson(String str) => List<CommandmentResponseModel>.from(json.decode(str).map((x) => CommandmentResponseModel.fromJson(x)));

String commandmentResponseModelToJson(List<CommandmentResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommandmentResponseModel {
  CommandmentResponseModel({
    this.id,
    this.isnKJVSelected=false,
    this.iskJVSelected=false,
    this.nkjv,
    this.kjv,
  });

  String? id;
  bool isnKJVSelected;
  bool iskJVSelected;
  List<String>? nkjv;
  List<String>? kjv;

  factory CommandmentResponseModel.fromJson(Map<String, dynamic> json) => CommandmentResponseModel(
    id: json["ID"],
    nkjv: List<String>.from(json["NKJV"].map((x) => x)),
    kjv: List<String>.from(json["KJV"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "NKJV": List<dynamic>.from(nkjv!.map((x) => x)),
    "KJV": List<dynamic>.from(kjv!.map((x) => x)),
  };
}
