import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationSelector extends StatefulWidget {
  const LocationSelector({super.key});

  @override
  _LocationSelectorState createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {
  String? selectedLocation;
  List<String> locations = ['Donnerville Drive', 'Mileștii Mici', 'Cricova'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/location.svg',
              width: 16,
              height: 16,
              color: const Color(0xFF667085),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedLocation,
                hint: const Text('Select Location'),
                items: locations.map((String location) {
                  return DropdownMenuItem<String>(
                    value: location,
                    child: Text(
                      location,
                      style: GoogleFonts.archivo(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedLocation = newValue;
                  });
                },
                underline: const SizedBox.shrink(),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xFF667085),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 0),
        Text(
          '4 Donnerville Hall, Donnerville Drive, Admaston, TF5 0DF',
          style: GoogleFonts.archivo(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: const Color(0xFF98A2B3),
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
