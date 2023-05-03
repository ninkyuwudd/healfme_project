import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text("Welcome To HealfMe"),
            // Image(image: AssetImage(assetName)),
            ElevatedButton(onPressed: (){}, child: Text("Lest get started"))

          ],
        ),
      ),
    );
  }
}