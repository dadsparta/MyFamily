import 'package:firebase_core/firebase_core.dart';
import 'package:myfamily/firebase_options.dart';


Future<void> initInjector() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}