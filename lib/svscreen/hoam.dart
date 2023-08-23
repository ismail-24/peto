import 'package:flutter/material.dart';

class hoam extends StatefulWidget {
  const hoam({super.key});

  @override
  State<hoam> createState() => _hoamState();
}

class _hoamState extends State<hoam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("welcom in hoam"),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 400,
                height: 400,
                child: Image.asset("assets/cat3.png"),

                //_LoginscreenState
              ),
            ],
          ),
        ),
      ),
    );
  }
}
