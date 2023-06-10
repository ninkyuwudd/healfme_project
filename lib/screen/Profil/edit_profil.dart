import 'package:flutter/material.dart';

class EditProfil extends StatefulWidget {
  static const routename = "/edit_profil";

  const EditProfil({Key? key}) : super(key: key);

  @override
  _EditProfilState createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profil'),
      ),
      body: Center(
        child: Text('Halaman Edit Profil'),
      ),
    );
  }
}
