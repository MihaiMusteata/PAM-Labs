import '../models/carousel_item.dart';

class FilterWines {
  List<CarouselItem> call(List<CarouselItem> wines, String query) {
    if (query.isEmpty) {
      return wines;
    }
    return wines.where((wine) {
      return wine.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}
