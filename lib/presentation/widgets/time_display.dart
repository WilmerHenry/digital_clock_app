import 'package:flutter/material.dart';

class TimeDisplay extends StatelessWidget {
  final DateTime dateTime;

  const TimeDisplay({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    final int rawHour = dateTime.hour;
    final int hour12 = rawHour > 12
        ? rawHour - 12
        : (rawHour == 0 ? 12 : rawHour);
    final String period = rawHour >= 12 ? 'PM' : 'AM';

    final String hourStr = hour12.toString().padLeft(2, '0');
    final String minuteStr = dateTime.minute.toString().padLeft(2, '0');
    final String secondStr = dateTime.second.toString().padLeft(2, '0');

    // Estilo Base con Fuente Digital Futuristic (Orbitron)
    final TextStyle baseStyle = TextStyle(
      fontFamily: 'Orbitron',
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    // Estilo para números grandes (Hora/Minutos)
    final TextStyle hugeStyle = baseStyle.copyWith(
      fontSize: 80,
      height: 1,
      letterSpacing: -2,
      shadows: [
        BoxShadow(
          color: Colors.cyanAccent.withValues(alpha: 0.8),
          blurRadius: 30,
          spreadRadius: 5,
        ),
        BoxShadow(
          color: Colors.white.withValues(alpha: 0.5),
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ],
    );

    // Estilo para indicadores (AM/PM y Segundos)
    final TextStyle indicatorStyle = baseStyle.copyWith(
      fontSize: 24,
      color: Colors.cyanAccent,
      letterSpacing: 2,
      shadows: [
        BoxShadow(
          color: Colors.cyanAccent.withValues(alpha: 0.6),
          blurRadius: 10,
          spreadRadius: 1,
        ),
      ],
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.cyanAccent.withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          // 1. INDICADOR AM/PM (Izquierda)
          Text(period, style: indicatorStyle),

          const SizedBox(width: 16),

          // 2. HORA
          Text(hourStr, style: hugeStyle),

          // 3. SEPARADOR
          AnimatedOpacity(
            opacity: dateTime.second % 2 == 0 ? 1.0 : 0.2,
            duration: const Duration(milliseconds: 500),
            child: Text(
              ":",
              style: hugeStyle.copyWith(
                color: Colors.white.withValues(alpha: 0.9),
                shadows: [
                  BoxShadow(
                    color: Colors.cyanAccent,
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
          ),

          // 4. MINUTOS
          Text(minuteStr, style: hugeStyle),

          const SizedBox(width: 16),

          // 5. SEGUNDOS (Derecha)
          Text(
            secondStr,
            style: indicatorStyle.copyWith(
              fontSize: 28, // Un poco más grande que AM/PM
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
