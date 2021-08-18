// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Data> DataFromJson(String str) => List<Data>.from(json.decode(str).map((x) => Data.fromJson(x)));

String DataToJson(List<Data> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Data {
  Data({
    this.id,
    this.complaintId,
    this.name,
    this.cnic,
    this.address,
    this.description,
    this.image,
    this.longitude,
    this.latitude,
    this.status,
  });

  String id;
  String complaintId;
  String name;
  String cnic;
  String address;
  String description;
  String image;
  String longitude;
  String latitude;
  String status;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    complaintId: json["complaint_ID"],
    name: json["Name"],
    cnic: json["cnic"],
    address: json["address"],
    description: json["Description"],
    image: json["image"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "complaint_ID": complaintId,
    "Name": name,
    "cnic": cnic,
    "address": address,
    "Description": description,
    "image": image,
    "longitude": longitude,
    "latitude": latitude,
    "Status": status,
  };
}
