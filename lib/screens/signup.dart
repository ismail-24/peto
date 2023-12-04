import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peto/screens/hoam.dart';
import 'package:peto/screens/signin.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final _forKey = GlobalKey<FormState>();
  bool ispassword = true;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _forKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        "images/Vector.png",
                        width: 250,
                        height: 200,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 65),
                    child: SizedBox(
                      width: 328,
                      child: Text(
                        "Create New \nAccount ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 1.40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Text full name
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, right: 10, left: 10, bottom: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Full Name',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder()),
                ),
              ),
              //Text phone
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, right: 10, left: 10, bottom: 10),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.length < 11) {
                      return 'Enter valid phone';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Phone',
                      prefixIcon: Icon(Icons.mobile_friendly),
                      border: OutlineInputBorder()),
                ),
              ),

              SizedBox(
                height: 5,
              ),
              // bottom email
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailcontroller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null ||
                        value.contains('@gmail.com') == false) {
                      return 'Enter valid Email';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder()),
                ),
              ),

              SizedBox(
                height: 5,
              ),
              // bottom password
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordcontroller,
                  obscureText: ispassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.length < 8) {
                      return 'Enter valid password';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: ispassword
                          ? IconButton(
                              icon: Icon(Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  ispassword = !ispassword;
                                });
                              },
                            )
                          : IconButton(
                              icon: Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  ispassword = !ispassword;
                                });
                              },
                            ),
                      border: OutlineInputBorder()),
                ),
              ),
              // bottom create
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF9647),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      if (_forKey.currentState!.validate()) {
                        bool result = await fireBaseSingUp(
                            emailcontroller.text, passwordcontroller.text);
                        if (result == true) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('success')),
                          );

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => hoam()));
                        }
                      }
                    },
                    child: Text(
                      "Sign up",
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      'or',
                      style: TextStyle(
                        color: Color(0xFFA8A8A8),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0.57,
                        letterSpacing: 0.80,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      signInOptions('images/google.png'),
                      signInOptions('images/facebook.png'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have an account? ',
                    style: TextStyle(
                      color: Color(0xFF1F2223),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 1.60,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => signin()),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xFFFF9647),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 1.50,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> fireBaseSingUp(String email, String password) async {
    try {
      UserCredential usercredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (usercredential.user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}
