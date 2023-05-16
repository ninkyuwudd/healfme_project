import 'package:flutter/material.dart';


class IconGrid extends StatelessWidget {
  final String img;
  final String poli;
  IconGrid({required this.img,required this.poli});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Column(
          children: [
            Image(image: AssetImage("images/$img.png"),width: 90,),
            SizedBox(height: 5,),
            Expanded(child: Text("$poli",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),))
          ],
        ),
      ),
    );
  }
}