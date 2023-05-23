import 'package:flutter/material.dart';


class IconGrid extends StatelessWidget {
  final String img;
  final String poli;
  final Function() fungsi;
  IconGrid({required this.img,required this.poli, required this.fungsi});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fungsi,
      child: Container(
        child: Column(
          children: [
            Image(image: AssetImage("images/$img.png"),width: 80,),
            SizedBox(height: 5,),
            Expanded(child: Text("$poli",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),))
          ],
        ),
      ),
    );
  }
}