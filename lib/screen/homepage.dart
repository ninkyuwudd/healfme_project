import 'package:flutter/material.dart';
import 'package:healthproject/screen/apotik_page.dart';
import 'package:healthproject/widget/homepage/icon_grid.dart';
import 'package:healthproject/widget/homepage/profile_card.dart';

class Homepage extends StatefulWidget {
  static const routename = "/homepage";
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
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
                ProfileCardHome(name: "Reihan Wudd hibatullah"),

                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text("PUSKESMAS JEMBER"),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Poli",
                  style: TextStyle(color: Color.fromARGB(255, 85, 85, 85)),
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
                      ),
                      IconGrid(img: "pgigi", poli: "Poli Gigi"),
                      IconGrid(img: "plansia", poli: "Poli Lansia"),
                      IconGrid(
                        img: "pgizi",
                        poli: "Poli Gizi",
                      ),
                      IconGrid(
                        img: "pkia",
                        poli: "Poli Kia",
                      ),
                      IconGrid(
                        img: "sanitasi",
                        poli: "Sanitasi",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Fitur",
                  style: TextStyle(color: Color.fromARGB(255, 85, 85, 85)),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, ApotikTerdekatPage.routename);
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
                                  Text("Cari "),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Apotik",
                                    style: TextStyle(fontSize: 30),
                                  ),
                                ],
                              ),
                              Text(
                                "Terdekat mu disini",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Image(image: AssetImage("images/apotek.png"),width: 80,)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
