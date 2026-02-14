import 'package:flutter/material.dart';
import 'package:digital_clock_app/logic/clock_controller.dart';
import 'package:digital_clock_app/presentation/widgets/time_display.dart';
import 'package:digital_clock_app/presentation/widgets/data_display.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  final ClockController _controller = ClockController();

  @override
  void initState() {
    super.initState();
    _controller.startClock();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.0,
            colors: [
              Color(0xFF1C2833),
              Color(0xFF0D1117),
            ],
          ),
        ),
        child: SafeArea(
          child: StreamBuilder<DateTime>(
            stream: _controller.timeStream,
            initialData: DateTime.now(),
            builder: (context, snapshot) {
              final time = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Espaciado superior para equilibrio visual
                  const Spacer(flex: 2),
                  
                  // Componente de Tiempo
                  TimeDisplay(dateTime: time),
                  
                  const SizedBox(height: 16),
                  
                  // Componente de Fecha
                  DataDisplay(dateTime: time),
                  
                  const Spacer(flex: 3),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
