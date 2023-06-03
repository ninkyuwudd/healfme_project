import 'package:flutter/material.dart';

class TextRingkasan extends StatelessWidget {
  final String isi;
  final Color isi2;
  const TextRingkasan({super.key, required this.isi, required this.isi2});

  @override
  Widget build(BuildContext context) {
    return Text(
      isi,
      style: TextStyle(
          color: isi2, fontSize: 14, fontWeight: FontWeight.w400, height: 2.0),
    );
  }
}
