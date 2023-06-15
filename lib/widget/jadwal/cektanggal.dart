import 'package:intl/intl.dart';

cektanggal(String hari) {
  print(DateFormat.d().format(DateTime.now()));
  int date = DateTime.now().weekday;
  int x = int.parse(DateFormat.d().format(DateTime.now()));
  
  if(hari == "Senin"){

  }else if(hari == "Selasa"){

  }else if(hari == "Rabu"){

  }else if(hari == "Kamis"){

  }else if(hari =="Jumat"){

  }else if(hari == "Sabtu"){

  }
}
