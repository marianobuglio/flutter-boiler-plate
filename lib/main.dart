
import 'package:acomerlapp/app.dart';
import 'package:acomerlapp/data/repositories/repositories.authentication/authentication/authentication_repository.dart';
import 'package:acomerlapp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {


  // todoList
  final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  // init local storage
  await GetStorage.init();

  FlutterNativeSplash.preserve(widgetsBinding: binding);
  // initialize firebase
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  )
  .then((FirebaseApp value) => {
    Get.put(AuthenticationRespositorie())
  });
  // initialize authentication
  runApp(const App());
}
