import 'dart:convert';

List<RequestBloodModel> requestBloodFromJson(String str) =>
    List<RequestBloodModel>.from(
        json.decode(str).map((x) => RequestBloodModel.fromJson(x)));

String requestBloodToJson(List<RequestBloodModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequestBloodModel {
  int id;
  String bloodType;
  String location;
  String phoneNumber;
  String status;
  String note;
  int createdBy;
  DateTime createdAt;
  String requestType;

  RequestBloodModel({
    required this.id,
    required this.bloodType,
    required this.location,
    required this.phoneNumber,
    required this.status,
    required this.note,
    required this.createdBy,
    required this.createdAt,
    required this.requestType,
  });

  factory RequestBloodModel.fromJson(Map<String, dynamic> json) =>
      RequestBloodModel(
        id: json["id"],
        bloodType: json["blood_type"]!,
        location: json["location"]!,
        phoneNumber: json["phone_number"],
        status: json["status"]!,
        note: json["note"]!,
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
        requestType: json["request_type"]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "blood_type": bloodType,
        "location": location,
        "phone_number": phoneNumber,
        "status": status,
        "note": note,
        "created_by": createdBy,
        "created_at": createdAt.toIso8601String(),
        "request_type": requestType,
      };
}