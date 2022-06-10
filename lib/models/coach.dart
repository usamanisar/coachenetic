import 'dart:convert';

Coach coachFromJson(String str) => Coach.fromJson(json.decode(str));

String coachToJson(Coach data) => json.encode(data.toJson());

class Coach {
  Coach({
    this.username,
    this.name,
    this.image,
    this.price,
    this.rating,
    this.reviews,
  });

  String username;
  String name;
  String image;
  String price;
  int rating;
  int reviews;

  factory Coach.fromJson(Map<String, dynamic> json) => Coach(
    username: json["username"],
    name: json["name"],
    image: json["image"],
    price: json["price"],
    rating: json["rating"],
    reviews: json["reviews"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "name": name,
    "image": image,
    "price": price,
    "rating": rating,
    "reviews": reviews,
  };
}
