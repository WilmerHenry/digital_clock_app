import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Asegúrate de que este nombre coincida exactamente con el 'name' en tu pubspec.yaml
import 'package:digital_clock_app/main.dart';

void main() {
  testWidgets('Digital Clock render test', (WidgetTester tester) async {
    // Eliminamos 'const' y nos aseguramos de que la clase sea accesible.
    // Si el error persiste, verifica que en lib/main.dart la clase se llame exactamente DigitalClockApp
    await tester.pumpWidget(const DigitalClockApp());

    // Buscamos componentes específicos que definimos en la interfaz profesional
    // Verificamos la existencia del icono de reloj
    expect(find.byIcon(Icons.access_time_filled), findsOneWidget);

    // Verificamos que se esté renderizando texto (la hora y la fecha)
    expect(find.byType(Text), findsAtLeastNWidgets(1));
  });
}
