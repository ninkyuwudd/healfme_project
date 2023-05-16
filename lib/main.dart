import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthproject/colors.dart';
import 'package:healthproject/provider/getfoto_provider.dart';
import 'package:healthproject/provider/user_repo.dart';
<<<<<<< HEAD
import 'package:healthproject/screen/daftar_poli.dart';
=======
>>>>>>> 251d9a58da0474b032467ed04cfa0a9ffb149055
import 'package:healthproject/screen/homepage.dart';
import 'package:healthproject/screen/login_page.dart';
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
        ChangeNotifierProvider(create: (_) => Getfoto())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Health',
        theme: ThemeData(
<<<<<<< HEAD
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          primarySwatch: mcgpalette0,
        ),
        home: UnggahKtpBpjs(),
        routes: {
          Homepage.routename: (context) => Homepage(),
          LoginPage.routename: (context) => LoginPage(),
=======
          textTheme: TextTheme(
            
            bodyMedium: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 57, 57, 57))
          ),
          primarySwatch: primary,
        ),
        home: SplashScreen(),
        routes: {
          Homepage.routename : (context) => Homepage(),
          LoginPage.routename : (context) => LoginPage(),
>>>>>>> 251d9a58da0474b032467ed04cfa0a9ffb149055
          RegisterPage.routename: (context) => RegisterPage(),
        },
      ),
    );
  }
}
