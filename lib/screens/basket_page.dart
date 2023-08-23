import 'package:flutter/material.dart';
import 'package:peto/screens/categories%20.dart';

class basket_page extends StatefulWidget {
  const basket_page({super.key});

  @override
  State<basket_page> createState() => _basket_pageState();
}

class _basket_pageState extends State<basket_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Categories(),
    );
  }
}
