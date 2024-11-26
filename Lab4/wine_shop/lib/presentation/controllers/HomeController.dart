import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/models/carousel_item.dart';
import '../../domain/models/wine_by.dart';
import '../../domain/usecases/filter_wines.dart';
import '../../domain/usecases/select_category.dart';
import '../../data/repositories/wine_repository_impl.dart';

class HomeController extends GetxController {
  final WineRepositoryImpl repository;
  final FilterWines filterWines;
  final SelectCategory selectCategory;

  HomeController({
    required this.repository,
    required this.filterWines,
    required this.selectCategory,
  });

  final RxList<CarouselItem> allWines = <CarouselItem>[].obs;
  final RxList<CarouselItem> filteredWines = <CarouselItem>[].obs;
  final RxList<WineBy> categories = <WineBy>[].obs;
  final RxString selectedCategory = ''.obs;
  final RxString searchText = ''.obs;
  final RxString selectedLocation = ''.obs;

  final List<String> locations = ['Donnerville Drive', 'Mileștii Mici', 'Cricova'];

  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _initializeData();
  }

  Future<void> _initializeData() async {
    try {
      final wineData = await repository.getWineData();
      categories.assignAll(wineData.winesBy);
      allWines.assignAll(wineData.carousel);
      filteredWines.assignAll(wineData.carousel);
      selectedCategory.value = selectCategory(wineData.winesBy.first.tag);
    } catch (e) {
      print('Error loading wine data: $e');
    }
  }

  void updateCategory(String category) {
    selectedCategory.value = category;
  }
  void updateSearchQuery(String query) {
    searchText.value = query;
    filteredWines.assignAll(filterWines(allWines, query));
  }

  void updateLocation(String location) {
    selectedLocation.value = location;
  }
}