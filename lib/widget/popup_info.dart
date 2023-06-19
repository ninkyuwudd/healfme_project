import 'package:flutter/material.dart';


class PopupInfo extends StatelessWidget {
  final String pesan;
  PopupInfo({super.key,required this.pesan});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Info"),
      content: Text(pesan),
      actions: [
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("oke")),
      ],
    );
  }
}