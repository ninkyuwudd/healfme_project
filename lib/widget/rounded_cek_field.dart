import 'package:flutter/material.dart';



class RoundeFieldWhiteCheck extends StatefulWidget {
  final String title;
  final String hover;
  final TextEditingController valuenya;
  RoundeFieldWhiteCheck({
    required this.valuenya,
    required this.title,
    required this.hover,
  });

  @override
  State<RoundeFieldWhiteCheck> createState() => _RoundeFieldWhiteCheckState();
}

class _RoundeFieldWhiteCheckState extends State<RoundeFieldWhiteCheck> {
  bool ckfield = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,style: TextStyle(color: Color.fromARGB(255, 65, 65, 65),fontWeight: FontWeight.bold,fontSize: 18),),
                  SizedBox(height: 10,),
                  TextField(
                    controller: widget.valuenya,
                    onChanged: (value) {
                       if (value == "") {
                            setState(() {
                              ckfield = true;
                            });
                          } else {
                            setState(() {
                              ckfield = false;
                            });
                          }
                    },
                    decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                      hintText: widget.hover,
                      fillColor: Colors.white,
                      filled: true,
                      // ignore: dead_code
                      errorText: ckfield ? "${widget.title} Can't be empty!" : null),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  
                ],
              ),
    );
  }
}