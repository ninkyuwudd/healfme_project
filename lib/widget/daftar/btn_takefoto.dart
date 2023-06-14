import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/getfoto_provider.dart';

class BtnTakeFoto extends StatefulWidget {
  final String judul;
  // final String imgpath;
  const BtnTakeFoto({required this.judul});

  @override
  State<BtnTakeFoto> createState() => _BtnTakeFotoState();
}

class _BtnTakeFotoState extends State<BtnTakeFoto> {

  bool widgetvisibel = true;
  @override
  Widget build(BuildContext context) {
    File? imgpath;
    var getimage = Provider.of<Getfoto>(context, listen: false);
    
    File? path = widget.judul == "Bpjs" ? getimage.imageBpjs : getimage.imageKtp ;

    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Unggah ${widget.judul}",
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 220,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  
                    image:widget.judul == "Ktp" && getimage.imageKtp != null  
                        ? FileImage(getimage.imageKtp!):
                        getimage.imageBpjs != null && widget.judul == "Bpjs"? FileImage(getimage.imageBpjs!):AssetImage("images/takefotobg.png") as ImageProvider,fit: BoxFit.cover),),

                        
            child:path == null ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt_outlined),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(minimumSize: Size(120, 30)),
                      onPressed: () async {
                        if(widget.judul == "Bpjs"){
                          await getimage.getfromcamera();
                        }else if(widget.judul == "Ktp"){
                          await getimage.getfromcameraktp();
                        }
                        setState(() {
                          imgpath = path;
                        });
                        // print(getimage.imagefile);
                        // print(imgpath);
                      },
                      child: Text(
                        "Camera",
                        style: TextStyle(fontSize: 12),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(minimumSize: Size(120, 30)),
                      onPressed: () async {
                        await getimage.getfromgallery();
                        setState(() {
                          imgpath = path;
                        });
                      },
                      child: Text(
                        "Galeri",
                        style: TextStyle(fontSize: 12),
                      )),
                ],
              
            ):Container(child: IconButton(onPressed: (){
              showDialog(context: context, builder: ( (context) {
                return AlertDialog(
                  title: Text("Unggang ulang gambar"),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(minimumSize: Size(120, 30)),
                      onPressed: () async {
                        if(widget.judul == "Bpjs"){
                          await getimage.getfromcamera();
                        }else if(widget.judul == "Ktp"){
                          await getimage.getfromcameraktp();
                        }
                        setState(() {
                          imgpath = path;
                        });
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Camera",
                        style: TextStyle(fontSize: 12),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(minimumSize: Size(120, 30)),
                      onPressed: () async {
                        if(widget.judul == "Bpjs"){
                          await getimage.getfromgallery();
                        }else if(widget.judul == "Ktp"){
                          await getimage.getfromgalleryktp();
                        }
                        setState(() {
                          imgpath = path;
                        });
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Galeri",
                        style: TextStyle(fontSize: 12),
                      )),
                  ],
                );
            
              }));
            }, icon: Icon(Icons.replay_outlined,color: Colors.white,shadows: [
              Shadow(color: Colors.black, blurRadius: 1.0)
            ],)),)
          )
        ],
      ),
    );
  }
}