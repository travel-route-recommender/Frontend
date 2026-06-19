import 'package:flutter_test/flutter_test.dart';
import 'package:tripmatch/app.dart';
import 'package:tripmatch/data/repositories/trip_repository.dart';

void main() {
  testWidgets('TripMatch app smoke test', (WidgetTester tester) async {
    final repository = TripRepository();
    await tester.pumpWidget(TripMatchApp(tripRepository: repository));

    expect(find.text('TripMatch'), findsOneWidget);
    expect(find.text('여행 성향 진단 시작하기'), findsOneWidget);
  });
}
