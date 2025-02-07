import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:instagram_clone/core/providers/auth_provider.dart';
import 'package:instagram_clone/features/auth/screens/material/material_login_screen.dart';
import 'package:instagram_clone/features/home/screens/material/material_home_screen.dart';
import 'package:provider/provider.dart';

void main(){
  group('HomeScreen Widget Tests', (){

    testWidgets('Should render home screen elements', (WidgetTester tester) async{
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider(
            create: (_) => AuthProvider(),
            child: MaterialHomeScreen()
          )
        )
      );

      expect(find.text('Instagram'), findsOneWidget);
      expect(find.byIcon(Icons.logout), findsOneWidget);
      expect(find.text('Welcome to Instagram'), findsOneWidget);
    });

    testWidgets('Logout button should navigate to login screen', (WidgetTester tester) async{
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider(
            create: (_) => AuthProvider(),
            child: MaterialHomeScreen()
          )
        )
      );

      await tester.tap(find.byIcon(Icons.logout));
      await tester.pumpAndSettle();

      expect(find.byType(MaterialLoginScreen), findsOneWidget);
    });
  });
}