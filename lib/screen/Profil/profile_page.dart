import 'package:flutter/material.dart';
import 'package:healthproject/provider/user_repo.dart';
import 'package:healthproject/screen/Profil/edit_profil.dart';
import 'package:provider/provider.dart';

import 'about.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loaduser = Provider.of<UserProvider>(context);
    var getuser = loaduser.akun;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'images/logodaftar.png',
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Container(
              width: 360,
              height: 170,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 253, 220, 255).withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image:loaduser.getUserData[7] == null ?DecorationImage(image: AssetImage("images/empty.jpg")) :DecorationImage(
                                image: NetworkImage(
                                    loaduser.getUserData[7].toString()),
                                fit: BoxFit.cover),
                          ),
                        ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Amanda Vania',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '20 Tahun',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, EditProfil.routename);
                          },
                          child: Text(
                            'Edit Profil',
                            style: TextStyle(
                              color: Color.fromARGB(255, 92, 92,
                                  92), // Ubah warna sesuai kebutuhan Anda
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 232, 232, 232)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Ubah radius sesuai kebutuhan Anda
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20), // Jarak antara card dan tombol

// Tombol "About"
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, about.routeName);
              },
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                  Colors.transparent,
                ),
                foregroundColor: MaterialStateProperty.all(
                  Colors.black,
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(
                    vertical: 8, // Ubah nilai sesuai kebutuhan Anda
                    horizontal: 12, // Ubah nilai sesuai kebutuhan Anda
                  ),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20), // Ubah radius sesuai kebutuhan Anda
                    side: BorderSide(
                      color: Color.fromARGB(255, 223, 223, 223),
                      width: 1,
                    ),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: Colors.purple, // Mengubah warna ikon menjadi ungu
                  ),
                  Text('Tentang Kami'),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),

// Tombol "Logout"
            TextButton(
              onPressed: () {
                // Aksi yang akan dilakukan ketika tombol "Logout" ditekan
              },
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                  Colors.transparent,
                ),
                foregroundColor: MaterialStateProperty.all(
                  Colors.black,
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(
                    vertical: 8, // Ubah nilai sesuai kebutuhan Anda
                    horizontal: 12, // Ubah nilai sesuai kebutuhan Anda
                  ),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20), // Ubah radius sesuai kebutuhan Anda
                    side: BorderSide(
                      color: Color.fromARGB(255, 223, 223, 223),
                      width: 1,
                    ),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.logout_rounded,
                    color: Colors.purple, // Mengubah warna ikon menjadi ungu
                  ), // Icon di sebelah kiri
                  Text('Logout'),
                  Icon(Icons.arrow_forward), // Icon di sebelah kanan
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}