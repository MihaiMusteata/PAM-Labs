import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationBox extends StatelessWidget {
  final int notificationCount;

  const NotificationBox({super.key, required this.notificationCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: const Color(0xFFD0D5DD), width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.notifications,
            color: Colors.grey[600],
            size: 30,
          ),
          if (notificationCount >
              0)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Color(0xFFBE2C55),
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: 14,
                  minHeight: 14,
                ),
                child: Text(
                  '$notificationCount',
                  style: GoogleFonts.archivo(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
