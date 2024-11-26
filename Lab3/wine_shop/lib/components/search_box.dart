import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../controller/HomeController.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFD0D5DD), width: 1),
        color: Colors.white.withOpacity(0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.search),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Color(0xFF98A2B3),
                ),
                border: InputBorder.none,
              ),
              style: GoogleFonts.archivo(
                fontSize: 16,
              ),
              onChanged: (value) {
                controller.filterWines(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
