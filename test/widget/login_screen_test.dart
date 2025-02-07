import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:instagram_clone/core/providers/auth_provider.dart';
import 'package:instagram_clone/features/auth/screens/material/material_login_screen.dart';
import 'package:provider/provider.dart';

void main(){
  group('Login Screen widget Tests', (){

    testWidgets('Should render all login screen elements', (WidgetTester tester) async{
        await tester.pumpWidget(
          MaterialApp(
            home: ChangeNotifierProvider(
              create: (_) => AuthProvider(),
              child: MaterialLoginScreen())
          )
        );

        expect(find.text('Instagram'), findsOneWidget);
        expect(find.byType(TextField), findsNWidgets(2));
        expect(find.text('Login'), findsOneWidget);
        expect(find.text('Forgot Password?'), findsOneWidget);
        expect(find.text('Continue with Facebook'), findsOneWidget);
        expect(find.text('Don\'t have an account?'), findsOneWidget);
        expect(find.text('Sign Up'), findsOneWidget);
    });

    testWidgets('Should show error or invalid login', (WidgetTester tester) async{
      await tester.pumpWidget(
          MaterialApp(
            home: ChangeNotifierProvider(
              create: (_) => AuthProvider(),
              child: MaterialLoginScreen())
          )
        );

      await tester.enterText(find.byType(TextField).first, 'wrong@email.com');
      await tester.enterText(find.byType(TextField).last, 'wrongpassword');

      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      expect(find.text('Invalid email or password'), findsOneWidget);
    });

    testWidgets('Should login successfully', (WidgetTester tester) async{
      await tester.pumpWidget(
          MaterialApp(
            home: ChangeNotifierProvider(
              create: (_) => AuthProvider(),
              child:MaterialLoginScreen())
          )
        );

      await tester.enterText(find.byType(TextField).first, 'insta@clone.com');
      await tester.enterText(find.byType(TextField).last, 'password');

      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      expect(find.text('Invalid email or password'), findsNothing);
      expect(find.byIcon(Icons.logout), findsOneWidget);
  });
  });
}
