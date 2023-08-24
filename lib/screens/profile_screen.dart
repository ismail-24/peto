import 'package:flutter/material.dart';
import 'package:peto/screens/Developers.dart';
import 'package:peto/screens/aboutscreen.dart';
import 'package:peto/svscreen/signin.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 70.0,
                backgroundImage: AssetImage('assets/person.png'),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'user name',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                email,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20.0),
              _settingItem(
                title: 'Account',
                icon: Icons.edit,
                onTap: () {
                  // Navigation
                },
              ),
              _settingItem(
                title: 'Share App',
                icon: Icons.share,
                onTap: () {
                  // Navigation
                },
              ),
              _settingItem(
                title: 'Rate Us',
                icon: Icons.star,
                onTap: () {
                  // Navigation
                },
                iconColor: Colors.amber,
              ),
              _settingItem(
                title: 'About',
                icon: Icons.info_outline,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const aboutscreen()));
                },
              ),
              _settingItem(
                title: 'Developers',
                icon: Icons.person,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const developers()));
                },
              ),
              _settingItem(
                title: 'Logout',
                icon: Icons.logout,
                onTap: () {
                  // Navigation
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _settingItem({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    Color? iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.grey[300],
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: iconColor),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
