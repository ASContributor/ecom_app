import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentuser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailandPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e!.message);
    }
  }

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<bool> isTokenValid() async {
    try {
      // Get the current user
      User? user = _firebaseAuth.currentUser;

      // Check if the user is signed in
      if (user != null) {
        // Get the user's ID token result
        IdTokenResult tokenResult = await user.getIdTokenResult();

        // Get the token's expiration time
        DateTime expirationTime = tokenResult.expirationTime ?? DateTime.now();

        // Compare the expiration time with the current time
        if (expirationTime.isAfter(DateTime.now())) {
          // Token is still valid
          return true;
        } else {
          // Token has expired
          // You can implement token refresh logic here if needed
          return false;
        }
      }
    } catch (e) {
      print("Error checking token validity: $e");
    }

    // If any error occurs, consider the token as invalid
    return false;
  }
}
