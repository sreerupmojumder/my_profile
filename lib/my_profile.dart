import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 103, 57, 212),
        title: Text('My Profile', style: TextStyle(color: Colors.white)),
        // add title in app bar centered
        centerTitle: true,
        elevation: 1,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Profile section
            
          //Information cards

          //Social media links

        ],
      ),
    );
  }
}