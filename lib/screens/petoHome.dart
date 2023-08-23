import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peto/comp/comp.dart';
import 'package:peto/screens/categories%20.dart';
import 'package:peto/screens/home.dart';

import 'basket_page.dart';
import 'details_page.dart';

class petoHome extends StatefulWidget {
  const petoHome({super.key});

  @override
  State<petoHome> createState() => _petoHomeState();
}

class _petoHomeState extends State<petoHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Text(
                'Peto',
                style: TextStyle(
                  color: Color(0xFF1F2223),
                  fontSize: 42,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 1.30,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 65,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                child: Container(
                  width: 370,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF3F3F3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Search for your product ",
                        hintStyle: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                        prefixIcon: Icon(Icons.search)),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 370,
                    height: 149.00002,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 150, 71, 1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 15,
                            ),
                            Text(
                              "Discount 20%",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "18/8/2023 - 24/8/2023\n",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Apply for all pet\n",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 251, 169, 106),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(55),
                                    bottomLeft: Radius.circular(60))),
                            width: 162,
                            height: 600,
                            child: Image.asset("assets/cato.png")),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Categories ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF000000))),
                  ],
                ),
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      categories_comp(
                          image: "assets/dogo.png",
                          name: "Dog",
                          color: 0xFF3E423F,
                          context: context,
                          categoriesepage: Categories(),
                          backGroundColor: 0xFFFEF1E4),
                      categories_comp(
                          image: "assets/catoo.png",
                          name: "Cat",
                          color: (0xFF3E423F),
                          context: context,
                          categoriesepage: Categories(),
                          backGroundColor: 0xB2B7DFF5),
                      categories_comp(
                          image: "assets/birdo.png",
                          name: "Bird",
                          color: 0xFF3E423F,
                          context: context,
                          categoriesepage: Categories(),
                          backGroundColor: 0xB2D3B0E0),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Categories(),
                                  ),
                                );
                              });
                            },
                            child: Icon(Icons.navigate_next),
                          ),
                          Text(
                            "more",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Best  Seller ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF000000))),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    product_compo(
                        Image1: "assets/product.png",
                        Icon: "assets/shop.png",
                        productName: "ROYAL CANIN",
                        producPrice: "\$22,99",
                        context: context,
                        page1: Details_page(),
                        page2: basket_page()),
                    SizedBox(
                      width: 20,
                    ),
                    product_compo(
                        Image1: "assets/kitten.png",
                        Icon: "assets/shop.png",
                        productName: "ROYAL CANIN",
                        producPrice: "\$22,99",
                        context: context,
                        page1: Details_page(),
                        page2: basket_page()),
                    SizedBox(
                      width: 20,
                    ),
                    product_compo(
                        Image1: "assets/product.png",
                        Icon: "assets/shop.png",
                        productName: "ROYAL CANIN",
                        producPrice: "\$22,99",
                        context: context,
                        page1: Details_page(),
                        page2: basket_page()),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Categories(),
                              ),
                            );
                          },
                          child: Icon(Icons.navigate_next),
                        ),
                        Text("more",
                            style: TextStyle(fontSize: 15, color: Colors.grey))
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Sale",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF000000))),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    product_compo(
                        Image1: "assets/kitten.png",
                        Icon: "assets/shop.png",
                        productName: "ROYAL CANIN",
                        producPrice: "\$22,99",
                        context: context,
                        page1: Details_page(),
                        page2: basket_page()),
                    SizedBox(
                      width: 40,
                    ),
                    product_compo(
                        Image1: "assets/product.png",
                        Icon: "assets/shop.png",
                        productName: "ROYAL CANIN",
                        producPrice: "\$22,99",
                        context: context,
                        page1: Details_page(),
                        page2: basket_page()),
                    SizedBox(
                      width: 40,
                    ),
                    product_compo(
                        Image1: "assets/kitten.png",
                        Icon: "assets/shop.png",
                        productName: "ROYAL CANIN",
                        producPrice: "\$22,99",
                        context: context,
                        page1: Details_page(),
                        page2: basket_page()),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Categories(),
                              ),
                            );
                          },
                          child: Icon(Icons.navigate_next),
                        ),
                        Text("more",
                            style: TextStyle(fontSize: 15, color: Colors.grey))
                      ],
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
