
import 'package:flutter/material.dart';
import 'package:healthproject/provider/user_repo.dart';
import 'package:healthproject/screen/poli/jadwal.dart';
import 'package:provider/provider.dart';
import '../widget/homepage/icon_grid.dart';
import '../widget/homepage/profile_card.dart';
import 'apotek/apotik_list_page.dart';
import 'berita/berita_page.dart';

class HomepageAdmin extends StatefulWidget {
  static const routename = "/homepageAdmin";
  // final int idx;
  // HomepageAdmin({super.key, required this.idx});

  @override
  State<HomepageAdmin> createState() => _HomepageAdminState();
}

class _HomepageAdminState extends State<HomepageAdmin> {


  @override
  Widget build(BuildContext context) {

    // final getdata = Provider.of<UserProvider>(context);
    // final loadata
    var loaduser = Provider.of<UserProvider>(context);
    var getuser = loaduser.getUserData;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            // width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image(
                      image: AssetImage("images/logodaftar.png"),
                      width: 120,
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                ProfileCardHome(name: getuser[0]),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text("Edit Jadwal Seuai Poli"),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 250,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                      IconGrid(
                        img: "pumum",
                        poli: "Poli Umum",
                        fungsi: () {
                          Navigator.pushNamed(context, JadwalPoli.routename,arguments: "Poli Umum");
                        },
                      ),
                      IconGrid(
                        img: "pgigi",
                        poli: "Poli Gigi",
                        fungsi: () {
                           Navigator.pushNamed(context, JadwalPoli.routename,arguments: "Poli Gigi");
                        },
                      ),
                      IconGrid(
                        img: "plansia",
                        poli: "Poli Lansia",
                        fungsi: () {
                          Navigator.pushNamed(context, JadwalPoli.routename,arguments: "Poli Lansia");
                        },
                      ),
                      IconGrid(
                        img: "pgizi",
                        poli: "Poli Gizi",
                        fungsi: () {
                          Navigator.pushNamed(context, JadwalPoli.routename,arguments: "Poli Gizi");
                        },
                      ),
                      IconGrid(
                        img: "pkia",
                        poli: "Poli Kia",
                        fungsi: () {
                          Navigator.pushNamed(context, JadwalPoli.routename,arguments: "Poli Kia");
                        },
                      ),
                      IconGrid(
                        img: "sanitasi",
                        poli: "Sanitasi",
                        fungsi: () {
                          Navigator.pushNamed(context, JadwalPoli.routename,arguments: "Poli Sanitasi");
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ApotekList.routename);
                  },
                  child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage("images/bg_card_home.png"),
                            fit: BoxFit.cover)),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15, top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("Scan"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Qr code",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                "Pasien",
                                style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Image(
                          image: AssetImage("images/qricon.png"),
                          width: 120,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 100,)
                ,
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    
                    onPressed: (){}, child: Text("LogOut")))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
