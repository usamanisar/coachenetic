
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.username,
    this.name,
    this.email,
    this.phone,
    this.dob,
    this.experience,
    this.price,
    this.categoryId,
    this.status,
    this.deviceType,
    this.token,
    this.role,
    this.image,
    this.certificate,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String username;
  String name;
  String email;
  String phone;
  String dob;
  String experience;
  String price;
  String categoryId;
  String status;
  String deviceType;
  String token;
  int role;
  String image;
  String certificate;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json["username"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    dob: json["dob"],
    experience: json["experience"],
    price: json["price"],
    categoryId: json["category_id"],
    status: json["status"],
    deviceType: json["device_type"],
    token: json["token"],
    role: json["role"],
    image: json["image"],
    certificate: json["certificate"],
    updatedAt: json["updated_at"]!=null?DateTime.parse(json["updated_at"]):null,
    createdAt: json["created_at"]!=null?DateTime.parse(json["created_at"]):null,
    id: json["id"],
  );

  Map<String, dynamic> toJson() =>
      {
        "username": username,
        "name": name,
        "email": email,
        "phone": phone,
        "dob": dob,
        "experience": experience,
        "price": price,
        "category_id": categoryId,
        "status": status,
        "device_type": deviceType,
        "token": token,
        "role": role,
        "image": image,
        "certificate": certificate,
        "updated_at": updatedAt!=null?updatedAt.toIso8601String():null,
        "created_at": createdAt!=null?createdAt.toIso8601String():null,
        "id": id,
      };
}
