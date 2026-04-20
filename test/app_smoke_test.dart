import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio/app.dart';
import 'package:my_portfolio/state/app_settings_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('renders hero actions', (tester) async {
    final controller = AppSettingsController();

    await tester.pumpWidget(PortfolioApp(controller: controller));
    await tester.pumpAndSettle();

    expect(find.text('View Projects'), findsOneWidget);
    expect(find.text('View CV'), findsOneWidget);
  });

  testWidgets('supports Arabic locale rendering', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final controller = AppSettingsController();
    await controller.toggleLanguage();

    await tester.pumpWidget(PortfolioApp(controller: controller));
    await tester.pumpAndSettle();

    expect(find.text('الرئيسية'), findsOneWidget);
    expect(find.text('عرض المشاريع'), findsOneWidget);
  });
}
