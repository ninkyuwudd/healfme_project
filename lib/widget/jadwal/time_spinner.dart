import 'package:flutter/material.dart';
import 'package:healthproject/provider/jadwalPoli_provider.dart';
import 'package:provider/provider.dart';
import 'package:time_picker_spinner/time_picker_spinner.dart';

class SpinerTime extends StatefulWidget {
  final String tipe;
  SpinerTime({super.key, required this.tipe});

  @override
  State<SpinerTime> createState() => _SpinerTimeState();
}

class _SpinerTimeState extends State<SpinerTime> {
  var dateTime = DateTime.now();
  
  @override
  Widget build(BuildContext context) {
    String dateSet = '${dateTime.hour} : ${dateTime.minute}';
    var loadJadwal = Provider.of<JadwalProvider>(context);
    String tipedata = widget.tipe;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: [
            Text(
              dateSet,
              style: Theme.of(context).textTheme.headline4,
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Masukkan Jadwal"),
                          content: SizedBox(
                            height: 300,
                            child: Column(
                              children: [
                                TimePickerSpinner(
                                  locale: const Locale('en', ''),
                                  time: dateTime,
                                  is24HourMode: false,
                                  isShowSeconds: false,
                                  itemHeight: 80,
                                  normalTextStyle: const TextStyle(
                                    fontSize: 24,
                                  ),
                                  highlightedTextStyle: const TextStyle(
                                      fontSize: 24, color: Colors.blue),
                                  isForce2Digits: true,
                                  onTimeChange: (time) {
                                    
                                    if (tipedata == "mulai") {
                                      print("$tipedata : $time");
                                      setState(() {
                                        dateTime = time;
                                      });
                                   
                                    } else if (tipedata == "selesai") {
                                      print("$tipedata : $time");
                                      setState(() {
                                        dateTime = time;
                                      });
                                  ;
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                    String newDataTime = '${dateTime.hour} : ${dateTime.minute}';
                                    if (tipedata == "mulai") {

                                      loadJadwal.chagenJadwalMulai(newDataTime);
                                    } else if (tipedata == "selesai") {
                                      loadJadwal.changeJadwalSelesai(newDataTime);
                                    }
                                  Navigator.pop(context);
                                },
                                child: Text("Oke"))
                          ],
                        );
                      });
                },
                icon: Icon(Icons.edit))
          ],
        ),
        const Divider(),
      ],
    );
  }
}
