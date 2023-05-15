import 'package:flutter/material.dart';

class ProfileCardHome extends StatelessWidget {
  final String name;
  ProfileCardHome({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, 
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
            color: Color.fromARGB(14, 0, 0, 0),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 10))
      ]),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selemat Datang",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Text(name,style: TextStyle(color: Color.fromARGB(255, 89, 89, 89)),),
              ],
            ),
          ),
          Spacer(),
          Image(
            image: AssetImage("images/img_profile_home.png"),
            width: 100,
          )
        ],
      ),
    );
  }
}
