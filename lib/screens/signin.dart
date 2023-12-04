import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:peto/screens/signup.dart';
// import 'package:peto/svscreen/welcom.dart';
import 'package:peto/screens/home.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => signinState();
}

String email = '';

class signinState extends State<signin> {
  bool ispassword = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {
        email = emailController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Form(
              key: _formKey,
              child: Column(children: [
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          "images/Vector.png",
                          width: 200,
                          height: 200,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 65),
                      child: SizedBox(
                        width: 328,
                        child: Text(
                          "Hello, \nWelcome Back! ",
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return 'Enter valid Email';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder()),
                  ),
                ),
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
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      bool result = await firebaselogin(
                          emailController.text, passwordcontroller.text);
                      if (result == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => home(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('login failed')),
                        );
                      }
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 400,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF9647),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Sign in",
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
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
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
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
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
                          MaterialPageRoute(builder: (context) => signup()),
                        );
                      },
                      child: Text(
                        "Create Account",
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
                SizedBox(
                  height: 40,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> firebaselogin(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return false;
  }
}

Container signInOptions(String image) {
  return Container(
    width: 156,
    height: 56,
    padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
    child: ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(
            const Color.fromRGBO(248, 164, 76, 0.698)),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        backgroundColor: MaterialStateProperty.all(Color(0xFFF3F3F3)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(
              color: Color.fromRGBO(248, 164, 76, 0.698),
            ),
          ),
        ),
      ),
      child: Center(
        child: Image.asset(image),
      ),
    ),
  );
}
