import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peto/screens/home.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> cate = [];
  List<String> cateName = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('categories').get();

    querySnapshot.docs.forEach((document) {
      String image = document.get('image') as String;
      String ctgName = document.get('ctgName') as String;

      setState(() {
        cate.add(image);
        cateName.add(ctgName);
      });
    });
  }

  Color mySplashColor = const Color.fromRGBO(255, 115, 34, 0.2);
  bool isPressed = false;

  Container _buildCategoryContainer(
    String label,
  ) {
    return Container(
      padding: const EdgeInsets.only(left: 2, right: 2, top: 8),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(
              const Color.fromRGBO(248, 164, 76, 0.698)),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
              side: const BorderSide(
                color: Color.fromRGBO(248, 164, 76, 0.698),
              ),
            ),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xFF181725),
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 1,
          ),
        ),
      ),
    );
  }

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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 350,
              height: 40,
              decoration: ShapeDecoration(
                color: const Color(0xFFF3F3F3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF3F3F3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Search for your product ",
                    hintStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    prefixIcon: Icon(Icons.search)),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
                  _buildCategoryContainer('All'),
                  _buildCategoryContainer('Dogs'),
                  _buildCategoryContainer('Cats'),
                  _buildCategoryContainer('Brids'),
                  _buildCategoryContainer('Fish'),
                  _buildCategoryContainer('Sale & Best seller'),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 360,
                    height: 700,
                    child: ListView.builder(
                      itemCount: (cate.length / 2).ceil(),
                      itemBuilder: (context, index) {
                        final int firstImageIndex = index * 2;
                        final int secondImageIndex = firstImageIndex + 1;

                        return Container(
                          padding: const EdgeInsets.only(
                            top: 8,
                            left: 8,
                            right: 8,
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 156,
                                height: 189.11,
                                child: Card(
                                  color: const Color(0x19F8A44C),
                                  margin: const EdgeInsets.all(0),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      width: 0.50,
                                      color:
                                          Color.fromRGBO(248, 164, 76, 0.698),
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        child: Image.asset(
                                          cate[firstImageIndex],
                                          width: 115,
                                          height: 130,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => home()),
                                          );
                                        },
                                        child: Text(
                                          cateName[firstImageIndex],
                                          style: const TextStyle(
                                            color: Color(0xFF181725),
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 1.38,
                                            letterSpacing: 0.10,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 156,
                                height: 189.11,
                                child: Card(
                                  color: const Color(0x19F8A44C),
                                  margin: const EdgeInsets.all(0),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      width: 0.50,
                                      color: Color(0xB2F8A44C),
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        child: Image.asset(
                                          secondImageIndex < cate.length
                                              ? cate[secondImageIndex]
                                              : 'images/Vector.png',
                                          height: 115,
                                          width: 115,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => home()),
                                          );
                                        },
                                        child: Text(
                                          cateName[secondImageIndex],
                                          style: const TextStyle(
                                            color: Color(0xFF181725),
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 3,
                                            letterSpacing: 0.10,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
