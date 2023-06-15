import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthproject/colors.dart';
import 'package:healthproject/provider/apotik_provider.dart';
import 'package:healthproject/provider/berita_provider.dart';
import 'package:healthproject/provider/geolocator_provider.dart';
import 'package:healthproject/provider/getfoto_provider.dart';
import 'package:healthproject/provider/jadwalPoli_provider.dart';
import 'package:healthproject/provider/maps_provider.dart';
import 'package:healthproject/provider/pilihfile_controller.dart';
import 'package:healthproject/provider/user_repo.dart';
import 'package:healthproject/screen/Profil/about.dart';
import 'package:healthproject/screen/Profil/edit_profil.dart';
import 'package:healthproject/screen/apotek/apotik_list_page.dart';
import 'package:healthproject/screen/apotek/apotik_maps_page.dart';
import 'package:healthproject/screen/berita/berita_detail_page.dart';
import 'package:healthproject/screen/berita/berita_page.dart';
import 'package:healthproject/screen/homepage%20_admin.dart';
import 'package:healthproject/screen/poli/daftar_poli.dart';
import 'package:healthproject/screen/poli/ringkasan.dart';
import 'package:healthproject/screen/homepage.dart';
import 'package:healthproject/screen/poli/jadwal.dart';
import 'package:healthproject/screen/login_page.dart';
import 'package:healthproject/screen/navigationbar.dart';
import 'package:healthproject/screen/poli/pendaftaran.dart';
import 'package:healthproject/screen/poli/scan_daftar.dart';
import 'package:healthproject/screen/register_page.dart';
import 'package:healthproject/screen/testing/maps_poly_test.dart';
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
        ChangeNotifierProvider(create: (_) => BeritaProvider()),
        ChangeNotifierProvider(create: (_) => JadwalProvider()),
        ChangeNotifierProvider(create: (_) => PilihUploadfile())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Health',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          primarySwatch: mcgpalette0,
        ),
        home: LoginPage(),
        // home:  QrScanPage(),

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
          JadwalPoli.routename :(context) => JadwalPoli(),
          Ringkasan.routename: (context) => Ringkasan(),
          about.routeName : (context) => about(),
          EditProfil.routename :(context) =>  EditProfil(),
          HomepageAdmin.routename :(context) => HomepageAdmin(),
          QrScanPage.routename : (context) => QrScanPage()
        },
      ),
    );
  }
}
