import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            // Image(image: AssetImage("images/logo.png")),
            // Image(image: AssetImage(assetName)),
            Text("Welcome To HealfMe"),
            
            ElevatedButton(onPressed: (){

            }, child: Text("Lest Get Started"))
          
          ],
        ),
      ),
    );
  }
}