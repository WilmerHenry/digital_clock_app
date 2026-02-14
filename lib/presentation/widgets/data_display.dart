import 'package:flutter/material.dart';

class DataDisplay extends StatelessWidget {
  final DateTime dateTime;

  const DataDisplay({super.key, required this.dateTime});

  static const List<String> _months = [
    'ENERO',
    'FEBRERO',
    'MARZO',
    'ABRIL',
    'MAYO',
    'JUNIO',
    'JULIO',
    'AGOSTO',
    'SEPTIEMBRE',
    'OCTUBRE',
    'NOVIEMBRE',
    'DICIEMBRE',
  ];

  static const List<String> _days = [
    'LUNES',
    'MARTES',
    'MIÉRCOLES',
    'JUEVES',
    'VIERNES',
    'SÁBADO',
    'DOMINGO',
  ];

  @override
  Widget build(BuildContext context) {
    final String dayName = _days[dateTime.weekday - 1];
    final String monthName = _months[dateTime.month - 1];
    final String dayNumber = dateTime.day.toString().padLeft(2, '0');
    final String year = dateTime.year.toString();

    final TextStyle textStyle = TextStyle(
      fontFamily: 'Orbitron',
      color: Colors.white,
      fontSize: 14,
      letterSpacing: 3,
      fontWeight: FontWeight.bold,
      shadows: [
        BoxShadow(
          color: Colors.cyanAccent.withValues(alpha: 0.5),
          blurRadius: 5,
        ),
      ],
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
          width: 0.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icono Decorativo
          Icon(
            Icons.calendar_month_outlined,
            color: Colors.cyanAccent.withValues(alpha: 0.7),
            size: 18,
          ),

          const SizedBox(width: 15),

          // LUNES
          Text(dayName, style: textStyle.copyWith(color: Colors.cyanAccent)),

          const SizedBox(width: 15),

          // Separador Vertical
          Container(height: 15, width: 1, color: Colors.white30),

          const SizedBox(width: 15),

          // 24 NOVIEMBRE 2024
          Text(
            "$dayNumber $monthName $year",
            style: textStyle.copyWith(
              color: Colors.white.withValues(alpha: 0.9),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
