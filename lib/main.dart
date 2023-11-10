import 'package:flutter/material.dart';
import 'app_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "XXX",
      appId: "1:723218430671:android:90f895b235b31fb4f055ba",
      messagingSenderId: "723218430671",
      projectId: "ordens-de-servico-fe71c",
    ),);
  runApp(const AppWidget(
    title: '',
  ));
}
