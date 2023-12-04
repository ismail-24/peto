import 'package:flutter/material.dart';
import 'package:peto/screens/signin.dart';

class welcom extends StatefulWidget {
  const welcom({super.key});

  @override
  State<welcom> createState() => _welcomState();
}

class _welcomState extends State<welcom> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 400,
                      height: 300,
                      child: Image.asset("assets/Illustration.png"),

                      //_LoginscreenState
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 400,
                      child: Center(
                          child: Text(
                        'Let’s Take Care of Them',
                        style: TextStyle(
                          color: Color(0xFF1F2223),
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 1.30,
                        ),
                      )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 288,
                      child: Text(
                        'This is the best choice to please your beloved pet, well yeah let’s do it.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF9F9F9F),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 1.50,
                          letterSpacing: -0.14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => signin()),
                          );
                        }
                        ;
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 40),
                        child: Container(
                          width: 400,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF9647),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Next',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
