import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/wine_type.dart';

class WineTypeCard extends StatelessWidget {
  final WineType wineType;

  const WineTypeCard({Key? key, required this.wineType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFF2F4F7),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            height: 153,
            wineType.imagePath,
            fit: BoxFit.cover,
          ),
          Container(
            width: 145,
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  wineType.title,
                  style: GoogleFonts.archivo(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
