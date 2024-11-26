import 'package:get/get.dart';
import '../models/carousel_item.dart';
import '../models/wine_by.dart';
import '../models/wine_data.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class HomeController extends GetxController {
  final RxList<CarouselItem> allWines = <CarouselItem>[].obs;
  final RxList<CarouselItem> filteredWines = <CarouselItem>[].obs;
  final RxList<WineBy> categories = <WineBy>[].obs;
  final RxString selectedCategory = ''.obs;
  final RxString searchText = ''.obs;
  final RxString selectedLocation = ''.obs;
  final List<String> locations = ['Donnerville Drive', 'Mileștii Mici', 'Cricova'];

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  Future<void> _loadData() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = json.decode(response);
    final wineData = WineData.fromJson(data);

    categories.assignAll(wineData.winesBy);
    allWines.assignAll(wineData.carousel);
    filteredWines.assignAll(wineData.carousel);
    selectedCategory.value = wineData.winesBy.first.tag;
  }

  void filterWines(String query) {
    searchText.value = query;
    print("Text din SearchBox: $query");

    if (query.isEmpty) {
      filteredWines.assignAll(allWines);
    } else {
      final wines = allWines.where((wine) {
        return wine.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
      filteredWines.assignAll(wines);
    }
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  void setLocation(String location) {
    selectedLocation.value = location;
  }
}
