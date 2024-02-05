



import 'package:acomerlapp/data/repositories/user/user_repository.dart';
import 'package:acomerlapp/features/authentication/signup/models/User.dart';
import 'package:acomerlapp/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
 static UserController get instance => Get.find();
  
  final userRepository = Get.put(UserRepository());

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      final nameParts = UserModel.nameParts(userCredential!.user!.displayName ?? '');
      final username = UserModel.generateUsername(userCredential.user!.displayName ?? '');
      final user = UserModel(
        id: userCredential.user!.uid,
        firstName: nameParts[0],
        lastName: nameParts.length > 1 ? nameParts[1] : '',
        username: username,
        email: userCredential.user!.email ?? '',
        phone: userCredential.user!.phoneNumber ?? '',
        profileImage: userCredential.user!.photoURL ?? ''
      );
      //save user data
       await userRepository.saveUserRecord(user);
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Data not saved', message: 'There was an error saving the user data, please try again later');
    }
  }
}