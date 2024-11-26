import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wine_shop_v2/models/wine.dart';

class WineCard extends StatelessWidget {
  final Wine wine;
  final Function(int) onFavouriteToggle;

  const WineCard({
    super.key,
    required this.wine,
    required this.onFavouriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    bool isAvailable = wine.status.toLowerCase() == 'available';
    Color statusColor = isAvailable ? Colors.green : Colors.red;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    wine.picturePath,
                    width: 80,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 4),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          wine.status,
                          style: TextStyle(
                            color: statusColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        wine.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/cheers.svg',
                                height: 16,
                                width: 16,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                wine.origin,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/flag.svg',
                                height: 16,
                                width: 16,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                wine.type,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F4F7),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => onFavouriteToggle(wine.id),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: wine.isFavourite
                              ? const Color(0XFFBE2C55)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: wine.isFavourite
                              ? null
                              : Border.all(color: Colors.black),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              wine.isFavourite
                                  ? 'assets/icons/heart.svg'
                                  : 'assets/icons/heart_outline.svg',
                              height: 20,
                              width: 20,
                              color: wine.isFavourite
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              wine.isFavourite ? 'Added' : 'Favourite',
                              style: GoogleFonts.archivo(
                                color: wine.isFavourite
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      '₹ ${wine.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14),
                        children: [
                          const TextSpan(text: "Critics' Scores: "),
                          TextSpan(
                            text: "${wine.score}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(text: " / 100"),
                        ],
                      ),
                    ),
                    Text(
                      'Bottle (${wine.size} ml)',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
