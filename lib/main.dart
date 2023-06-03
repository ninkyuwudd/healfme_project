import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthproject/colors.dart';
import 'package:healthproject/provider/apotik_provider.dart';
import 'package:healthproject/provider/berita_provider.dart';
import 'package:healthproject/provider/geolocator_provider.dart';
import 'package:healthproject/provider/getfoto_provider.dart';
import 'package:healthproject/provider/maps_provider.dart';
import 'package:healthproject/provider/user_repo.dart';
import 'package:healthproject/screen/apotik_list_page.dart';
import 'package:healthproject/screen/apotik_maps_page.dart';
import 'package:healthproject/screen/berita_detail_page.dart';
import 'package:healthproject/screen/berita_page.dart';
import 'package:healthproject/screen/daftar_poli.dart';
import 'package:healthproject/screen/ringkasan.dart';
import 'package:healthproject/screen/homepage.dart';
import 'package:healthproject/screen/jadwal.dart';
import 'package:healthproject/screen/login_page.dart';
import 'package:healthproject/screen/maps_page.dart';
import 'package:healthproject/screen/navigationbar.dart';
import 'package:healthproject/screen/pendaftaran.dart';
import 'package:healthproject/screen/register_page.dart';
import 'package:healthproject/screen/splash_page.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => Getfoto()),
        ChangeNotifierProvider(create: (_) => MapsApiProvider()),
        ChangeNotifierProvider(create: (_) => ApotekProvider()),
        ChangeNotifierProvider(create: (_) => CurrentLocProvider()),
        ChangeNotifierProvider(create: (_) => BeritaProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Health',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          primarySwatch: mcgpalette0,
        ),
        home: LoginPage(),
        routes: {
          Homepage.routename: (context) => Homepage(),
          LoginPage.routename: (context) => LoginPage(),
          RegisterPage.routename: (context) => RegisterPage(),
          ApotikTerdekatPage.routename : (context) => ApotikTerdekatPage(),
          ApotekList.routename :(context) => ApotekList(),
          UnggahKtpBpjs.routename :(context) => UnggahKtpBpjs(),
          BeritaPage.routename :(context) => BeritaPage(),
          DetailBeritaPage.routename :(context) => DetailBeritaPage(),
          BottomNavigationBarPage.routename :(context) => BottomNavigationBarPage(),
          FormPendaftaran.routename :(context) => FormPendaftaran(),
          JadwalPoli.routename :(context) => JadwalPoli()
          Ringkasan.routename: (context) => Ringkasan()
        },
      ),
    );
  }
}
