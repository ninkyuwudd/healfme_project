import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  static const routename = "/splash";
  // SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage("images/logo.png"),width: 80,),
              SizedBox(height: MediaQuery.of(context).size.height /8,),
              Image(image: AssetImage("images/splash.png"),width: 250,),
              SizedBox(height: 20,),
              Text("WELCOME",),
              Spacer(),
              ElevatedButton(onPressed: (){
                Navigator.pushReplacementNamed(context, "/login");
              }, child: Text("Lest get started")),
    
            ],
          ),
        ),
      ),
    );
  }
}