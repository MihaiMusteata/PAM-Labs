import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wine_shop_v2/components/wine_card.dart';
import 'package:wine_shop_v2/mockup/wine_list.dart';
import 'package:wine_shop_v2/mockup/wine_categories.dart';
import 'package:wine_shop_v2/mockup/wine_type_list.dart';
import 'package:wine_shop_v2/components/wine_type_card.dart';
import '../components/location_selector.dart';
import '../components/notification_box.dart';
import '../components/search_box.dart';
import '../models/wine.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  List<Wine> _filteredWines = [];
  String _selectedCategory = 'Type';

  @override
  void initState() {
    super.initState();
    _filteredWines = wineList;
  }

  void _filterWines(String query) {
    final filtered = wineList.where((wine) {
      final titleLower = wine.title.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      _filteredWines = filtered;
    });
  }

  void _toggleFavourite(int id) {
    setState(() {
      final wineIndex = wineList.indexWhere((wine) => wine.id == id);
      if (wineIndex != -1) {
        wineList[wineIndex].isFavourite = !wineList[wineIndex].isFavourite;
      }
    });
  }

  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
    print("Selected category: $category");
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Select Location'),
      ),
      body: Padding(
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
            SearchBox(
              controller: searchController,
              onChanged: (String text) {
                _filterWines(text);
              },
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
              children: wineCategories.map((category) {
                final isSelected = category == _selectedCategory;
                return GestureDetector(
                  onTap: () => _selectCategory(category),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: isSelected ? Color(0xFFF5DFE5) : Color(0xFFFCFCFD),
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color:
                            isSelected ? Color(0xFFBE2C55) : Color(0xFFD0D5DD),
                      ),
                    ),
                    child: Text(
                      category,
                      style: GoogleFonts.archivo(
                        color:
                            isSelected ? Color(0xFFBE2C55) : Color(0xFF475467),
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w400,
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
                itemCount: _filteredWines.length,
                itemBuilder: (context, index) {
                  final wine = _filteredWines[index];

                  return WineCard(
                    wine: wine,
                    onFavouriteToggle: _toggleFavourite,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
