import 'dart:convert';
import '../../domain/models/wine.dart';

Map<String, dynamic> wineToJson(Wine wine) {
  return {
    'name': wine.name,
    'image': wine.image,
    'critic_score': wine.criticScore,
    'bottle_size': wine.bottleSize,
    'price_usd': wine.price,
    'type': wine.type,
    'from': {
      'city': wine.from.city,
      'country': wine.from.country,
    },
  };
}

Wine wineFromJson(String str) {
  final jsonData = json.decode(str);
  return Wine.fromJson(jsonData);
}

List<Wine> winesFromJson(String str) {
  final jsonData = json.decode(str);
  return List<Wine>.from(jsonData.map((item) => Wine.fromJson(item)));
}
