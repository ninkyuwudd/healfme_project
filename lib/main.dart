import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthproject/colors.dart';
import 'package:healthproject/provider/user_repo.dart';
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
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Health',
        theme: ThemeData(
          textTheme: TextTheme(
            
            bodyMedium: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 57, 57, 57))
          ),
          primarySwatch: primary,
        ),
        home: SplashScreen(),
        routes: {
          Homepage.routename : (context) => Homepage(),
          LoginPage.routename : (context) => LoginPage(),
          RegisterPage.routename: (context) => RegisterPage(),
        },
      ),
    );
  }
}
