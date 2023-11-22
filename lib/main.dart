import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myfamily/data/app_injector.dart';
import 'package:myfamily/pages/page_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjector();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  runApp(MyApp(firestore: firestore,));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.firestore});
  final FirebaseFirestore firestore;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Family',
      home: PageControllerModel(instance: firestore,),
      debugShowCheckedModeBanner: false,
    );
  }
}