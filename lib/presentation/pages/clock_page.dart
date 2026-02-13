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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0F2027),
              Color(0xFF203A43),
              Color(0xFF2C5364),
            ],
          ),
        ),
        child: Center(
          child: StreamBuilder<DateTime>(
            stream: _controller.timeStream,
            initialData: DateTime.now(),
            builder: (context, snapshot) {
              // snapshot.data won't be null because of initialData
              final time = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: const Duration(milliseconds: 800),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Transform.scale(
                          scale: value,
                          child: child,
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.access_time_filled,
                      size: 60,
                      color: Colors.cyanAccent,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TimeDisplay(dateTime: time),
                  const SizedBox(height: 20),
                  DataDisplay(dateTime: time),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
