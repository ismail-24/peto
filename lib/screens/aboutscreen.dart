import 'package:flutter/material.dart';

class aboutscreen extends StatefulWidget {
  const aboutscreen({Key? key}) : super(key: key);

  @override
  State<aboutscreen> createState() => _aboutscreenState();
}

class _aboutscreenState extends State<aboutscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Color(0xfffafafa),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              const Center(
                child: SizedBox(
                    child: Text(
                  'About App',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 6,
                  ),
                )),
              ),
              Container(
                  child: const SizedBox(
                width: 327,
                child: Text(
                    'A pet app is a mobile application designed to assist pet owners in managing various aspects of their pets care and well-being'
                    'These apps typically offer a range of features and functionalities to cater to the needs of pet owners making their lives easier and enhancing the overall pet ownership experience.\nSome common features found in pet apps include:\nPet Profiles: Users can create profiles for their pets, including details such as name, breed, age, and medical history\n. This helps keep all essential information about the pet in one place for easy reference.Health Management: Pet apps often include features to track and manage the health of pets\n. This may include scheduling veterinary appointments, setting reminders for vaccinations or medication doses, and maintaining health records.\n'),
              ))
            ]),
          ),
        ));
  }
}
