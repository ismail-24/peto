import 'package:flutter/material.dart';
// import 'package:peto/screens/categories%20.dart';
// import 'package:peto/screens/home.dart';
// import 'package:peto/screens/petoHome.dart';
import 'package:peto/svscreen/welcom.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ;
  runApp(const petoMarket());
}

class petoMarket extends StatelessWidget {
  const petoMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: welcom(),
    );
  }
}
