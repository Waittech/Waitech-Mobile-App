// To parse this JSON data, do
//
//     final qrModel = qrModelFromJson(jsonString);

import 'dart:convert';

QrModel qrModelFromJson(String str) => QrModel.fromJson(json.decode(str));

String qrModelToJson(QrModel data) => json.encode(data.toJson());

class QrModel {
  QrModel({
    this.success,
    this.data,
    this.message,
    this.code,
  });

  bool? success;
  Data? data;
  dynamic message;
  int? code;

  factory QrModel.fromJson(Map<String, dynamic> json) => QrModel(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data!.toJson(),
    "message": message,
    "code": code,
  };
}

class Data {
  Data({
    required this.companyId,
    required this.tableId,
    required this.tableName,
  });

  int companyId;
  int tableId;
  String tableName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    companyId: json["company_id"],
    tableId: json["table_id"],
    tableName: json["table_name"],
  );

  Map<String, dynamic> toJson() => {
    "company_id": companyId,
    "table_id": tableId,
    "table_name": tableName,
  };
}
