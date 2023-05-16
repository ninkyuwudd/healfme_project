import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Getfoto extends ChangeNotifier {
  final ImagePicker picker = ImagePicker();
  File? imageKtp;
  File? imageBpjs;

  getfromgallery() async {
    XFile? pickfile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 200,
      maxWidth: 200,
    );
    // PickedFile? pickfile = await ImagePicker().getImage(
    //   source: ImageSource.gallery,

    // );
    if (pickfile != null) {
      // return File(pickfile.path);
      imageBpjs = File(pickfile.path);
      notifyListeners();
    }
  }

  getfromcamera() async {
    XFile? pickfile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 200,
      maxWidth: 200,
    );
    if (pickfile != null) {
      imageBpjs = File(pickfile.path);
      // return File(pickfile.path);
      notifyListeners();
    }
  }

  
  getfromgalleryktp() async {
    XFile? pickfile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 200,
      maxWidth: 200,
    );
    // PickedFile? pickfile = await ImagePicker().getImage(
    //   source: ImageSource.gallery,

    // );
    if (pickfile != null) {
      // return File(pickfile.path);
      imageKtp = File(pickfile.path);
      notifyListeners();
    }
  }

  getfromcameraktp() async {
    XFile? pickfile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 200,
      maxWidth: 200,
    );
    if (pickfile != null) {
      imageKtp = File(pickfile.path);
      // return File(pickfile.path);
      notifyListeners();
    }
  }

  changebpjs()async{
    
  }
}