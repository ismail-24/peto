//import 'dart:js';

//import 'dart:js';

//import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../screens/basket_page.dart';
import '../screens/details_page.dart';

categories_comp(
    {required String image,
    required String name,
    required var color,
    required context,
    required Widget categoriesepage,
    required var backGroundColor}) {
  return TextButton(
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (cpntext) => categoriesepage));
    },
    child: Container(
      decoration: BoxDecoration(
          color: Color(backGroundColor),
          borderRadius: BorderRadius.circular(5)),
      width: 142,
      height: 76,
      child: Row(
        children: [
          Image.asset(image),
          Text(name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(color),
              ))
        ],
      ),
    ),
  );
}

product_compo(
    {required String Image1,
    required String Icon,
    required String productName,
    required String producPrice,
    required Widget page1,
    required Widget page2,
    required BuildContext context}) {
  return Container(
      width: 156,
      height: 210,
      color: Color(0xFFF3F3F3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (cpntext) => page1));
            },
            child: Image.asset(Image1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(productName,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1A1919))),
                  Text(producPrice,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1A1919)))
                ],
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (cpntext) => page2));
                  },
                  child: Image.asset(Icon))
            ],
          ),
        ],
      ));
}
