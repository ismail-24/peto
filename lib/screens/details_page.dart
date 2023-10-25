import 'package:flutter/material.dart';
import 'package:counter_button/counter_button.dart';

class Details_page extends StatefulWidget {
  const Details_page({super.key});

  @override
  State<Details_page> createState() => _Details_pageState();
}

class _Details_pageState extends State<Details_page> {
  int _counterValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffffffff),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 73, right: 68, bottom: 24),
              child: Container(
                width: 219,
                height: 291,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/swc1.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      'Symply Dog Adult Chicken With Rice & Vegetables',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 1.20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    child: Text(
                      'This dog food is made with real chicken, which is a great source of protein to support muscle development and overall health. The addition of rice helps provide energy and supports healthy digestion, while the vegetables offer essential vitamins, minerals, and fiber.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color(0xFF9F9F9F),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.60,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 11, top: 22, bottom: 40),
                child: CounterButton(
                  loading: false,
                  onChange: (int val) {
                    setState(
                      () {
                        _counterValue = val;
                      },
                    );
                  },
                  count: _counterValue,
                ),
              ),
              // const SizedBox(width: 133),
              Padding(
                padding: const EdgeInsets.only(right: 11),
                child: Text(
                  '\$22,99',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 1.50,
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () async {},
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Container(
                width: 400,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFFF9647),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Add to Cart',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
