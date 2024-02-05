import 'package:acomerlapp/features/authentication/login/screens/login.dart';
import 'package:acomerlapp/features/authentication/signup/screens/verify_email.dart';
import 'package:acomerlapp/features/onboarding/screens/onboarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRespositorie extends GetxController {
  static AuthenticationRespositorie get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(const LoginScreen());
      } else {
        Get.offAll(VerifyEmail(email: user.email));
      }
    } else {
      if (deviceStorage.read('isFirstTime') == 'true') {
        Get.offAll(const OnBoardingScreen());
      } else {
        Get.offAll(const LoginScreen());
      }
    }
  }

  /// Email Authentication REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw getFirebaseAuthErrorType(e);
      // Handle the error type here
    } on FirebaseException catch (e) {
      throw getFirebaseErrorType(e);
      // Handle the error type here
    } on PlatformException catch (e) {
      throw getPlatformErrorType(e);
      // Handle the platform exception here
    } catch (e) {
      // Handle other exceptions
      throw 'Unknown error';
    }
  }

  /// Send Email Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw getFirebaseAuthErrorType(e);
      // Handle the error type here
    } on FirebaseException catch (e) {
      throw getFirebaseErrorType(e);
      // Handle the error type here
    } on PlatformException catch (e) {
      throw getPlatformErrorType(e);
      // Handle the platform exception here
    } catch (e) {
      // Handle other exceptions
      throw 'Unknown error';
    }
  }

  /// logOut
  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAll(const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw getFirebaseAuthErrorType(e);
      // Handle the error type here
    } on FirebaseException catch (e) {
      throw getFirebaseErrorType(e);
      // Handle the error type here
    } on PlatformException catch (e) {
      throw getPlatformErrorType(e);
      // Handle the platform exception here
    } catch (e) {
      // Handle other exceptions
      throw 'Unknown error';
    }
  }

  ///login with email and password
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw getFirebaseAuthErrorType(e);
      // Handle the error type here
    } on FirebaseException catch (e) {
      throw getFirebaseErrorType(e);
      // Handle the error type here
    } on PlatformException catch (e) {
      throw getPlatformErrorType(e);
      // Handle the platform exception here
    } catch (e) {
      // Handle other exceptions
      throw 'Unknown error';
    }
  }

  /// Google Sign In
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the Google Sign In process
      final GoogleSignInAccount? userAccount = await GoogleSignIn(
        // The OAuth client id of your app. This is required.
        clientId:
            '65942792368-r38oc0gsrsdmqrm25m4k15ahtvshl0ku.apps.googleusercontent.com',
      ).signIn();

      // Obtain the GoogleSignInAuthentication object
      final GoogleSignInAuthentication googleAuth =
          await userAccount!.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw getFirebaseAuthErrorType(e);
      // Handle the error type here
    } on FirebaseException catch (e) {
      throw getFirebaseErrorType(e);
      // Handle the error type here
    } on PlatformException catch (e) {
      throw getPlatformErrorType(e);
      // Handle the platform exception here
    } catch (e) {
      // Handle other exceptions
      if (kDebugMode) print('Somethingf went wrong ${e.toString()}');
      return null;
    }
  }


  /// send password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw getFirebaseAuthErrorType(e);
      // Handle the error type here
    } on FirebaseException catch (e) {
      throw getFirebaseErrorType(e);
      // Handle the error type here
    } on PlatformException catch (e) {
      throw getPlatformErrorType(e);
      // Handle the platform exception here
    } catch (e) {
      // Handle other exceptions
      throw 'Unknown error';
    }
  }

String getFirebaseAuthErrorType(FirebaseAuthException exception) {
  switch (exception.code) {
    case 'invalid-email':
      return 'Invalid email';
    case 'user-not-found':
      return 'User not found';
    case 'wrong-password':
      return 'Wrong password';
    case 'user-disabled':
      return 'User disabled';
    case 'too-many-requests':
      return 'Too many requests';
    case 'invalid-credential':
      return 'Password or email is incorrect';
    case 'email-already-in-use':
      return 'Email already in use';
    case 'operation-not-allowed':
      return 'Operation not allowed';
    case 'weak-password':
      return 'Weak password';
    case 'auth/invalid-email':
      return 'Invalid email';
    case 'auth/missing-android-pkg-name':
      return 'Missing Android package name';
    case 'auth/missing-continue-uri':
      return 'Missing continue URL';
    case 'auth/missing-ios-bundle-id':
      return 'Missing iOS Bundle ID';
    case 'auth/invalid-continue-uri':
      return 'Invalid continue URL';
    case 'auth/unauthorized-continue-uri':
      return 'Unauthorized continue URL';
    case 'auth/user-not-found':
      return 'User not found';
    default:
      return 'Firebase auth error';
  }
}
  
  String getFirebaseErrorType(FirebaseException exception) {
    switch (exception.code) {
      // Add cases for Firebase error codes
      default:
        return exception.message!;
    }
  }

  String getPlatformErrorType(PlatformException exception) {
    switch (exception.code) {
      // Add cases for Platform error codes
      default:
        return 'Platform error';
    }
  }
}
