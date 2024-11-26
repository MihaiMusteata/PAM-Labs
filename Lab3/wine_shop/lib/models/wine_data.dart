import 'package:wine_shop/models/carousel_item.dart';
import 'package:wine_shop/models/wine_by.dart';

class WineData {
  final List<WineBy> winesBy;
  final List<CarouselItem> carousel;

  WineData({required this.winesBy, required this.carousel});

  factory WineData.fromJson(Map<String, dynamic> json) {
    return WineData(
      winesBy: (json['wines_by'] as List)
          .map((item) => WineBy.fromJson(item))
          .toList(),
      carousel: (json['carousel'] as List)
          .map((item) => CarouselItem.fromJson(item))
          .toList(),
    );
  }
}
