





import 'package:acomerlapp/features/authentication/signup/models/User.dart';
import 'package:acomerlapp/utils/logging/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
     throw handleFirebaseException(e);
    } on PlatformException catch (e) {
     throw handlePlatformException(e);
    } on FormatException catch (e) {
     throw handleFormatException(e);
    } catch (e) {
      throw "Something went wrong";
    }
  }

  String handleFirebaseException(FirebaseException e) {
    // Handle the Firebase exception here
    TLoggerHelper.error(e.message!);
    switch (e.code) {
      case 'permission-denied':
        // Handle the permission denied error here
        return 'Permission denied';
      case 'unavailable':  
        return 'Service unavailable';
      case 'cancelled':
        return 'Cancelled';
      case 'unknown':
        return 'Unknown error';
      default:
        return 'Unknown error';
    }
    // You can add your own logic to handle the exception
  }

  String handlePlatformException(PlatformException e) {
    // Handle the platform exception here
    switch (e.code) {
      case 'invalid-argument':
        // Handle the invalid argument error here
        return 'Invalid argument';
      case 'failed-precondition':
        return 'Failed precondition';
      case 'aborted':
        return 'Aborted';
      case 'out-of-range':
        return 'Out of range';
      case 'unimplemented':
        return 'Unimplemented';
      case 'internal':
        return 'Internal';
      case 'unavailable':
        return 'Unavailable';
      case 'data-loss':
        return 'Data loss';
      case 'unauthenticated':
        return 'Unauthenticated';
      default:
        return 'Unknown error';
    }
    // You can add your own logic to handle the exception
  }

  String handleFormatException(FormatException e) {
     switch(e.runtimeType) {
       case FormatException:
         return 'Format exception';
       default:
         return 'Unknown error';
     }
  }
}

  
