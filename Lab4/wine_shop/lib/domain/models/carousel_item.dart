class CarouselItem {
  final String name;
  final String image;
  final int criticScore;
  final String bottleSize;
  final double priceUsd;
  final String type;
  final String country;
  final String city;

  CarouselItem({
    required this.name,
    required this.image,
    required this.criticScore,
    required this.bottleSize,
    required this.priceUsd,
    required this.type,
    required this.country,
    required this.city,
  });

  factory CarouselItem.fromJson(Map<String, dynamic> json) {
    return CarouselItem(
      name: json['name'],
      image: json['image'],
      criticScore: json['critic_score'],
      bottleSize: json['bottle_size'],
      priceUsd: (json['price_usd'] as num).toDouble(),
      type: json['type'],
      country: json['from']['country'],
      city: json['from']['city'],
    );
  }
}
