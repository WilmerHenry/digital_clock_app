import 'package:flutter/material.dart';

class DataDisplay extends StatelessWidget {
  final DateTime dateTime;

  const DataDisplay({super.key, required this.dateTime});

  static const List<String> _months = [
    'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
    'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre',
  ];

  static const List<String> _days = [
    'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo',
  ];

  @override
  Widget build(BuildContext context) {
    final String dayName = _days[dateTime.weekday - 1];
    final String monthName = _months[dateTime.month - 1];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Text(
        "$dayName, ${dateTime.day} de $monthName de ${dateTime.year}",
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white70,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
