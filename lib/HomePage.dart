import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MainUI());
  }
}

class MainUI extends StatefulWidget {
  const MainUI({super.key});

  @override
  State<MainUI> createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {
  List cateNames = [
    "SOS",
    "Gender Detection",
    "Location",
    "Hotspots",
  ];
  List<Color> cateColors = [
    const Color.fromARGB(255, 9, 101, 240),
    const Color.fromARGB(255, 16, 25, 202),
    const Color.fromARGB(255, 147, 69, 216),
    const Color.fromARGB(255, 75, 14, 241),
  ];

  List<Icon> catIcons = [
    Icon(
      Icons.category,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.person,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.location_on,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.dangerous,
      color: Colors.white,
      size: 30,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   foregroundColor: Colors.black,
        //   backgroundColor: const Color.fromARGB(255, 85, 160, 221),
        //   elevation: 0,
        //   centerTitle: true,
        //   title: Text(
        //     "SheSecure",
        //     style: TextStyle(
        //       fontWeight: FontWeight.bold,
        //       letterSpacing: 1,
        //     ),
        //   ),
        // ),
        body: Stack(
      children: [videomethod(context)],
    ));
  }

  Container videomethod(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: ListView(
        children: [
          header(),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 227, 224, 224),
                   image: DecorationImage(
      image: AssetImage('lib/assets/google.png'),
      fit: BoxFit.contain, 
      // Adjust the fit as needed
    ),),
              child: Center(
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.blue,
                      size: 40,
                    )),
              )),
          SizedBox(
            height: 10,
          ),
          Text(
            "Tips and Tools",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
              padding: EdgeInsets.only(left: 25, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GridView.builder(
                            itemCount: cateNames.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.1,
                            ),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                      height: 120,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        color: cateColors[index],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: catIcons[index],
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(cateNames[index],
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(0.8),
                                      ))
                                ],
                              );
                            })
                      ],
                    ),
                  )))
        ],
      ),
    );
  }

  Container header() {
    return Container(
        padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Icons.more_vert,
                  size: 30,
                  color: Colors.white,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: EdgeInsets.only(left: 3, bottom: 15),
                child: Text("Hi Miss",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      color: Colors.white,
                    ))),
            Container(
              height: 55,
              margin: EdgeInsets.only(top: 3, bottom: 15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search Here...",
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.8)),
                  contentPadding: EdgeInsets.only(top: 13),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            )
          ],
        ));
  }
}