import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../components/location_selector.dart';
import '../components/notification_box.dart';
import '../components/search_box.dart';
import '../components/wine_card.dart';
import '../components/wine_type_card.dart';
import '../controller/HomeController.dart';
import '../mockup/wine_type_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

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
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: LocationSelector(),
                  ),
                  SizedBox(width: 16),
                  SizedBox(
                    child: NotificationBox(notificationCount: 5),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SearchBox(),
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
                    onTap: () => controller.selectCategory(category.tag),
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
