import 'dart:convert';

class Shoe {
  final String displayName;
  final String name;
  final String price;
  final String image;

  Shoe({
    required this.displayName,
    required this.name,
    required this.price,
    required this.image,
  });

  Shoe copyWith({
    String? displayName,
    String? name,
    String? price,
    String? image,
  }) {
    return Shoe(
      displayName: displayName ?? this.displayName,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'name': name,
      'price': price,
      'image': image,
    };
  }

  factory Shoe.fromMap(Map<String, dynamic> map) {
    return Shoe(
      displayName: map['displayName'],
      name: map['name'],
      price: map['price'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Shoe.fromJson(String source) => Shoe.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Shoe(displayName: $displayName, name: $name, price: $price, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Shoe &&
        other.displayName == displayName &&
        other.name == name &&
        other.price == price &&
        other.image == image;
  }

  @override
  int get hashCode {
    return displayName.hashCode ^
        name.hashCode ^
        price.hashCode ^
        image.hashCode;
  }
}
