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
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Fondo Dinámico con Gradiente Profundo
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.2,
                colors: [
                  Color(0xFF234E52),
                  Color(0xFF0F2027),
                  Colors.black,
                ],
              ),
            ),
          ),
          
          // Elementos Decorativos de fondo (Opcional, círculos sutiles)
          Positioned(
            top: -100,
            right: -100,
            child: CircleAvatar(
              radius: 150,
              backgroundColor: Colors.cyanAccent.withOpacity(0.05),
            ),
          ),

          SafeArea(
            child: Center(
              child: StreamBuilder<DateTime>(
                stream: _controller.timeStream,
                initialData: DateTime.now(),
                builder: (context, snapshot) {
                  final time = snapshot.data!;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Header con estilo
                      TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0, end: 1),
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeOutBack,
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(0, 20 * (1 - value)),
                            child: Opacity(opacity: value, child: child),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.cyanAccent.withOpacity(0.5)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.cyanAccent.withOpacity(0.2),
                                    blurRadius: 20,
                                    spreadRadius: 2,
                                  )
                                ]
                              ),
                              child: const Icon(
                                Icons.watch_later_outlined,
                                size: 40,
                                color: Colors.cyanAccent,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "SISTEMA DE TIEMPO",
                              style: TextStyle(
                                color: Colors.cyanAccent.withOpacity(0.6),
                                letterSpacing: 8,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 50),
                      
                      // Pantalla de Tiempo Principal
                      TimeDisplay(dateTime: time),
                      
                      const SizedBox(height: 40),
                      
                      // Pantalla de Fecha con Glassmorphism
                      DataDisplay(dateTime: time),
                      
                      const SizedBox(height: 60),
                      
                      // Footer decorativo
                      Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.cyanAccent.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
