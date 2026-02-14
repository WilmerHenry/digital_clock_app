import 'package:flutter/material.dart';

class TimeDisplay extends StatelessWidget {
  final DateTime dateTime;

  const TimeDisplay({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    final String hour = dateTime.hour.toString().padLeft(2, '0');
    final String minute = dateTime.minute.toString().padLeft(2, '0');
    final String second = dateTime.second.toString().padLeft(2, '0');

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // Resplandor de fondo (Glow)
            Text(
              "$hour:$minute",
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: Colors.cyanAccent.withOpacity(0.15),
                letterSpacing: 4,
              ),
            ),
            // Texto principal
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  "$hour:$minute",
                  style: const TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 4,
                    shadows: [
                      Shadow(
                        color: Colors.black45,
                        offset: Offset(4, 4),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.cyanAccent.withOpacity(0.3)),
                  ),
                  child: Text(
                    second,
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w400,
                      color: Colors.cyanAccent,
                      fontFamily: 'Courier', // Estilo digital
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
