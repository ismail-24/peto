import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Color mySplashColor = const Color.fromRGBO(255, 115, 34, 0.2);
  List<String> cate = [
    'images/dog-food.png',
    'images/dog-grooming.png',
    'images/pet-bakery.png',
    'images/pngegg.png',
    'images/PngItem.png',
    'images/shutterstock.png',
  ];
  List<String> cateName = [
    'Dog Food',
    'Dog Grooming',
    'Pet bakery',
    'Dog Toys',
    'Dog Sleep',
    'Dog Treatment',
  ];
  Container _buildCategoryContainer(
    String label,
  ) {
    return Container(
      padding: EdgeInsets.only(left: 2, right: 2, top: 8),
      child: MaterialButton(
        splashColor: mySplashColor,
        onPressed: () {
          setState() {}
        },
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14))),
        child: Text(
          label,
          style: TextStyle(
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
        title: const Center(
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
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 350,
              height: 40,
              decoration: ShapeDecoration(
                color: Color(0xFFF3F3F3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const TextField(
                cursorColor: Color.fromARGB(255, 34, 32, 32),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIconColor: Colors.grey,
                  hintText: 'Search for your product',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
                  _buildCategoryContainer('All'),
                  _buildCategoryContainer('Dog'),
                  _buildCategoryContainer('Cat'),
                  _buildCategoryContainer('Small Animal'),
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
                      // scrollDirection: Axis.vertical,
                      // shrinkWrap: true,
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
                                  color: Color(0x19F8A44C),
                                  margin: EdgeInsets.all(0),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
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
                                        onPressed: () {},
                                        child: Text(
                                          cateName[firstImageIndex],
                                          style: TextStyle(
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
                                  color: Color(0x19F8A44C),
                                  margin: EdgeInsets.all(0),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
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
                                        onPressed: () {},
                                        child: Text(
                                          cateName[secondImageIndex],
                                          style: TextStyle(
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
