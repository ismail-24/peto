import 'package:flutter/material.dart';

class developers extends StatefulWidget {
  const developers({super.key});

  @override
  State<developers> createState() => _developersState();
}

class _developersState extends State<developers> {
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
          child: const Column(
            children: [
              Center(
                child: SizedBox(
                  child: Text(
                    'Team',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 4,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 60.0,
                    backgroundImage: AssetImage('assets/image.png'),
                  ),
                  SizedBox(height: 12.5),
                  Text(
                    'Ismail Tarek',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 60.0,
                            backgroundImage: AssetImage('assets/img3.png'),
                          ),
                          SizedBox(height: 12.5),
                          Text(
                            'Mariam Ashraf',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 60.0,
                            backgroundImage: AssetImage('assets/img2.png'),
                          ),
                          SizedBox(height: 12.5),
                          Text(
                            'Mariam Gamal',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 60.0,
                    backgroundImage: AssetImage('assets/img4.png'),
                  ),
                  SizedBox(height: 12.5),
                  Text(
                    'Mohammed Abdelfattah',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
