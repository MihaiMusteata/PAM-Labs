import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/HomeController.dart';

class LocationSelector extends StatelessWidget {
  const LocationSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

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
              child: Obx(() => DropdownButton<String>(
                isExpanded: true,
                value: controller.selectedLocation.isEmpty
                    ? null
                    : controller.selectedLocation.value,
                hint: const Text('Select Location'),
                items: controller.locations.map((String location) {
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
                  if (newValue != null) {
                    controller.setLocation(newValue);
                  }
                },
                underline: const SizedBox.shrink(),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xFF667085),
                ),
              )),
            ),
          ],
        ),
        const SizedBox(height: 0),
        Obx(() => Text(
          controller.selectedLocation.value,
          style: GoogleFonts.archivo(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: const Color(0xFF98A2B3),
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )),
      ],
    );
  }
}
