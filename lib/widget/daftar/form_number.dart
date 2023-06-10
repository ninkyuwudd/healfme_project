import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormNumber extends StatelessWidget {
  final TextEditingController value;
  final String title;
  final String hover;
  FormNumber(
      {super.key,
      required this.value,
      required this.title,
      required this.hover});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        autofocus: true,
        controller: value,
        validator: (value) {
          if (value == '') return "Text tidak boleh kosong";
          return null;
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 240, 144, 182))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 240, 144, 182))),
          label: Text(title),
          labelStyle: TextStyle(color: Color.fromARGB(255, 254, 36, 120)),
          hintText: (hover),
        ),
      ),
    );
  }
}
