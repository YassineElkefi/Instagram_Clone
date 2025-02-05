import 'package:flutter_test/flutter_test.dart';
import 'package:instagram_clone/core/providers/auth_provider.dart';

void main(){
  group('AuthProvider Tests', (){

    late AuthProvider authProvider;

    setUp((){
      authProvider = AuthProvider();
    });

    test('Initial State should be Logged out', (){
      expect(authProvider.isLoggedIn, false);
    });

    test('Login with incorrect credentials should keep isLoggedIn false', () async {
      authProvider.login('wrong@email.com', 'wrongpassword');
      expect(authProvider.isLoggedIn, false);
    });

    test('Login with correct credentials should set isLoggedIn to true', () async {
      authProvider.login('insta@clone.com','password');
      expect(authProvider.isLoggedIn, true);
    });

    test('Logout should set isLoggedIn to false', (){
      authProvider.login('insta@clone.com','password');
      expect(authProvider.isLoggedIn, true);

      authProvider.logout();
      expect(authProvider.isLoggedIn, false);
    });
  });
}
