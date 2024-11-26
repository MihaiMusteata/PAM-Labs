class Wine {
  final String name;
  final String image;
  final int criticScore;
  final String bottleSize;
  final double price;
  final String type;
  final WineLocation from;

  Wine({
    required this.name,
    required this.image,
    required this.criticScore,
    required this.bottleSize,
    required this.price,
    required this.type,
    required this.from,
  });

  factory Wine.fromJson(Map<String, dynamic> json) {
    return Wine(
      name: json['name'] as String,
      image: json['image'] as String,
      criticScore: json['critic_score'] as int,
      bottleSize: json['bottle_size'] as String,
      price: (json['price_usd'] as num).toDouble(),
      type: json['type'] as String,
      from: WineLocation.fromJson(json['from']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'critic_score': criticScore,
      'bottle_size': bottleSize,
      'price_usd': price,
      'type': type,
      'from': from.toJson(),
    };
  }
}

class WineLocation {
  final String city;
  final String country;

  WineLocation({
    required this.city,
    required this.country,
  });

  factory WineLocation.fromJson(Map<String, dynamic> json) {
    return WineLocation(
      city: json['city'] as String,
      country: json['country'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'country': country,
    };
  }
}
