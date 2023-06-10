import 'package:flutter/material.dart';


class BorderContainer extends StatelessWidget {
  final Function() fungsi;
  final String text;
  const BorderContainer({super.key, required this.fungsi, required this.text});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
                  onTap: fungsi(),
                  child: Container(
                    width: 100,
                    height: 40,
                    // color: Colors.brown,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color.fromARGB(255, 206, 75, 191), width: 2),
                    ),
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        Text(
                          text,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
      
                      ],
                    ),
                  ),
                );
  }
}