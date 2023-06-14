import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Getfoto extends ChangeNotifier {
  final ImagePicker picker = ImagePicker();
  File? imageKtp;
  File? imageBpjs;
  String namebpjs = '';
  String namektp = '';

  File? _imageFile;

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
      namebpjs = path.basename(imageBpjs!.path);
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
      namebpjs = path.basename(imageBpjs!.path);
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

    if (pickfile != null) {
      imageKtp = File(pickfile.path);
      namektp = path.basename(imageKtp!.path);
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
      namektp = path.basename(imageKtp!.path);
      notifyListeners();
    }
  }


    Future uploadImageToFirebasebpjs(String name,var uploadfile,String filename) async {
      print("fungsi gbr 2");
    if (uploadfile != null) {
      Reference storageReference =FirebaseStorage.instance.ref().child('images/$name/$filename');
      UploadTask uploadTask = storageReference.putFile(uploadfile!);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String imageUrl = await taskSnapshot.ref.getDownloadURL();
      print('Image uploaded to Firebase Storage: $imageUrl');
    } else {
      print('No image selected.');
    }
    notifyListeners();
  }


  // changebpjs()async{
    
  // }
}