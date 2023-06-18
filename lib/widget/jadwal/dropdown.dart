import 'package:flutter/material.dart';
import 'package:healthproject/screen/testing/apijadwaltest.dart';



class DropdownJadwal extends StatefulWidget {
  final List jadwal;
  final Function(String) getjadwal;
  DropdownJadwal({super.key, required this.jadwal, required this.getjadwal});

  @override
  State<DropdownJadwal> createState() => _DropdownJadwalState();
}

class _DropdownJadwalState extends State<DropdownJadwal> {
  String dropdownValue = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      dropdownValue = widget.jadwal.first;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    
    return DropdownButton(
      value: dropdownValue,
      items: widget.jadwal.map((val){
        return DropdownMenuItem<String>(
          value: val,
          child: Text(val),
        );
      }).toList(), 
      onChanged: (val){
        setState(() {
          dropdownValue = val.toString();
          print(val);
        });
        widget.getjadwal(dropdownValue);
      });
  }
}