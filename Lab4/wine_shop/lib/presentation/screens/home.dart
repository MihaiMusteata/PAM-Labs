import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../data/datasource/wine_data_source.dart';
import '../../data/repositories/wine_repository_impl.dart';
import '../../domain/usecases/filter_wines.dart';
import '../../domain/usecases/select_category.dart';
import '../controllers/HomeController.dart';
import '../mockup/wine_type_list.dart';
import '../widgets/location_selector.dart';
import '../widgets/notification_box.dart';
import '../widgets/search_box.dart';
import '../widgets/wine_card.dart';
import '../widgets/wine_type_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      HomeController(
        repository: WineRepositoryImpl(WineDataSource()),
        filterWines: FilterWines(),
        selectCategory: SelectCategory(),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Select Location'),
      ),
      body: Obx(() {
        if (controller.categories.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Obx(() {
                      return LocationSelector(
                        locations: controller.locations,
                        selectedLocation: controller.selectedLocation.value,
                        onLocationSelected: (newLocation) {
                          controller.updateLocation(newLocation);
                        },
                      );
                    }),
                  ),
                  const SizedBox(width: 16),
                  const SizedBox(
                    child: NotificationBox(notificationCount: 5),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              SearchBox(
                controller: controller.searchController,
                onSearch: (value) => controller.updateSearchQuery(value),
              ),
              const SizedBox(height: 16),
              Text(
                'Shop wines by',
                style: GoogleFonts.archivo(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: controller.categories.map((category) {
                  final isSelected =
                      category.tag == controller.selectedCategory.value;
                  return GestureDetector(
                    onTap: () => controller.updateCategory(category.tag),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFF5DFE5)
                            : const Color(0xFFFCFCFD),
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFFBE2C55)
                              : const Color(0xFFD0D5DD),
                        ),
                      ),
                      child: Text(
                        category.name,
                        style: GoogleFonts.archivo(
                          color: isSelected
                              ? const Color(0xFFBE2C55)
                              : const Color(0xFF475467),
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 189,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: wineTypeList.length,
                  itemBuilder: (context, index) {
                    final wineType = wineTypeList[index];
                    return WineTypeCard(wineType: wineType);
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Wine',
                style: GoogleFonts.archivo(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.filteredWines.length,
                  itemBuilder: (context, index) {
                    final wine = controller.filteredWines[index];
                    return WineCard(
                      wine: wine,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
