import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:instagram_clone/core/providers/auth_provider.dart';
import 'package:instagram_clone/main.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('End-to-End test', (){

    testWidgets('Full login flow test', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ],
      child: MyMaterialApp()
      )
      );
      await tester.pumpAndSettle();
      expect(find.text('Instagram'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(2));

      await tester.enterText(find.byType(TextField).first,'insta@clone.com');
      await tester.enterText(find.byType(TextField).last, 'password');

      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      expect(find.text('Welcome to Instagram'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.logout));
      await tester.pumpAndSettle();

      expect(find.text('Instagram'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(2));

      await tester.enterText(find.byType(TextField).first,'wrong@email.com');
      await tester.enterText(find.byType(TextField).last, 'wrongpassword');

      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      expect(find.text('Invalid email or password'), findsOneWidget);
      expect(find.text('Instagram'), findsOneWidget);
  });
});
}