import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio/app.dart';
import 'package:my_portfolio/state/app_settings_controller.dart';

void main() {
  testWidgets('renders hero actions', (tester) async {
    final controller = AppSettingsController();

    await tester.pumpWidget(PortfolioApp(controller: controller));
    await tester.pumpAndSettle();

    expect(find.text('View Projects'), findsOneWidget);
    expect(find.text('View CV'), findsOneWidget);
  });
}
