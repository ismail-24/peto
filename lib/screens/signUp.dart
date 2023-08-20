import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
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
      body: Column(
        children: [
          /*---------------------------------------
          ---------- search bar -------------------
          -----------------------------------------*/
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  controller: controller,
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                  onTap: () => controller.openView(),
                  onChanged: (_) => controller.openView(),
                  hintText: 'Search for your product',
                  leading: const Icon(Icons.search),
                );
              },
              suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
                return <ListTile>[];
              },
            ),
            //---------------------------------------
            //---------- end search bar -------------
            //---------------------------------------
          ),
        ],
      ),
    );
  }
}
