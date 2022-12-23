class QrModel {
  bool? success;
  Data? data;
  dynamic? message;
  int? code;

  QrModel({required this.success, required this.data, this.message, required this.code});

  QrModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}

class Data {
  int? companyId;
  int? tableId;
  String? tableName;

  Data({required this.companyId, required this.tableId, required this.tableName});

  Data.fromJson(Map<String, dynamic> json) {
    companyId = json['company_id'];
    tableId = json['table_id'];
    tableName = json['table_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_id'] = this.companyId;
    data['table_id'] = this.tableId;
    data['table_name'] = this.tableName;
    return data;
  }
}