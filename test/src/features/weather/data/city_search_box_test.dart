

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:open_weather_example_flutter/src/features/weather/presentation/city_search_box.dart';

class MockCityProvider extends Mock implements Ref {}

void main() {
  group('CitySearchBox Widget Tests', () {
    late MockCityProvider mockCityProvider;

    setUp(() {
      mockCityProvider = MockCityProvider();
    });

    testWidgets('Displays search box and button', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProviderScope(
              overrides: [
                Provider((ref) => mockCityProvider), // Override cityProvider
              ],
              child: const CitySearchBox(),
            ),
          ),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('search'), findsOneWidget);
    });

    // testWidgets('Input text into search box', (WidgetTester tester) async {
    //   when(mockCityProvider.read).thenReturn((ref) => '');

    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: Scaffold(
    //         body: ProviderScope(
    //           overrides: [
    //             Provider((ref) => mockCityProvider), // Override cityProvider
    //           ],
    //           child: WeatherPage(city: ''),
    //         ),
    //       ),
    //     ),
    //   );

    //   final inputField = find.byType(TextField);
    //   expect(inputField, findsOneWidget);

    //   await tester.enterText(inputField, 'New York');
    //   expect(find.text('New York'), findsOneWidget);
    // });

  });
}