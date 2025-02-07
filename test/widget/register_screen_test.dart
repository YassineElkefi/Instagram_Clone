import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:instagram_clone/core/providers/auth_provider.dart';
import 'package:instagram_clone/features/auth/screens/material/material_register_screen.dart';
import 'package:provider/provider.dart';

void main(){
  group('Register Screen widget Tests', (){

    testWidgets('Should render all login screen elements', (WidgetTester tester) async{
        await tester.pumpWidget(
          MaterialApp(
            home: ChangeNotifierProvider(
              create: (_) => AuthProvider(),
              child: MaterialRegisterScreen())
          )
        );

        expect(find.text('Instagram'), findsOneWidget);
        expect(find.text("Sign up to see photos and videos from your friends."), findsOneWidget);
        expect(find.byType(TextField), findsNWidgets(4));
        expect(find.text('Sign Up'), findsOneWidget);
        expect(find.text('By signing up, you agree to our Terms, Data Policy and Cookies Policy.'), findsOneWidget);
        expect(find.text('Have an account?'), findsOneWidget);
        expect(find.text('Log In'), findsOneWidget);
    });
  });
}