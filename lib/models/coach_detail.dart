
import 'dart:convert';

import 'package:coach_netic/models/user.dart';

import 'category.dart';

CoachDetail coachDetailFromJson(String str) => CoachDetail.fromJson(json.decode(str));

String coachDetailToJson(CoachDetail data) => json.encode(data.toJson());

class CoachDetail {
  CoachDetail({
    this.coach,
    this.rating,
    this.reviews,
  });

  Coach coach;
  int rating;
  int reviews;

  factory CoachDetail.fromJson(Map<String, dynamic> json) => CoachDetail(
    coach: Coach.fromJson(json["coach"]),
    rating: json["rating"],
    reviews: json["reviews"],
  );

  Map<String, dynamic> toJson() => {
    "coach": coach.toJson(),
    "rating": rating,
    "reviews": reviews,
  };
}

class Coach {
  Coach({
    this.id,
    this.name,
    this.username,
    this.email,
    this.emailVerifiedAt,
    this.phone,
    this.image,
    this.dob,
    this.height,
    this.weight,
    this.hip,
    this.waist,
    this.bvi,
    this.experience,
    this.certificate,
    this.status,
    this.role,
    this.deviceType,
    this.token,
    this.firebaseId,
    this.categoryId,
    this.description,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.reviews,
  });

  int id;
  String name;
  String username;
  String email;
  dynamic emailVerifiedAt;
  String phone;
  String image;
  DateTime dob;
  dynamic height;
  dynamic weight;
  dynamic hip;
  dynamic waist;
  dynamic bvi;
  String experience;
  String certificate;
  String status;
  int role;
  dynamic deviceType;
  dynamic token;
  dynamic firebaseId;
  String categoryId;
  String description;
  String price;
  DateTime createdAt;
  DateTime updatedAt;
  Category category;
  List<Review> reviews;

  factory Coach.fromJson(Map<String, dynamic> json) => Coach(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    phone: json["phone"],
    image: json["image"],
    dob: DateTime.parse(json["dob"]),
    height: json["height"],
    weight: json["weight"],
    hip: json["hip"],
    waist: json["waist"],
    bvi: json["bvi"],
    experience: json["experience"],
    certificate: json["certificate"],
    status: json["status"],
    role: json["role"],
    deviceType: json["device_type"],
    token: json["token"],
    firebaseId: json["firebaseID"],
    categoryId: json["category_id"],
    description: json["description"],
    price: json["price"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    category: Category.fromJson(json["category"]),
    reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "phone": phone,
    "image": image,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "height": height,
    "weight": weight,
    "hip": hip,
    "waist": waist,
    "bvi": bvi,
    "experience": experience,
    "certificate": certificate,
    "status": status,
    "role": role,
    "device_type": deviceType,
    "token": token,
    "firebaseID": firebaseId,
    "category_id": categoryId,
    "description": description,
    "price": price,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "category": category.toJson(),
    "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
  };
}


class Review {
  Review({
    this.id,
    this.userId,
    this.coachId,
    this.rating,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  int id;
  String userId;
  String coachId;
  String rating;
  String comment;
  DateTime createdAt;
  DateTime updatedAt;
  User user;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json["id"],
    userId: json["user_id"],
    coachId: json["coach_id"],
    rating: json["rating"],
    comment: json["comment"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "coach_id": coachId,
    "rating": rating,
    "comment": comment,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "user": user.toJson(),
  };
}

