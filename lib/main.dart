import 'package:flutter/material.dart';
import 'package:digital_clock_app/presentation/pages/clock_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DigitalClockApp());
}

class DigitalClockApp extends StatelessWidget {
  const DigitalClockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital Clock Pro',
      theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
      home: const ClockPage(),
    );
  }
}
