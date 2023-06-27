import 'package:flutter/material.dart';
import 'package:gestion_livraison/providers/LivraisonMultiprovider.dart';
import 'package:gestion_livraison/screens/pages/chat.dart';
import 'package:gestion_livraison/screens/pages/dashboard.dart';
import 'package:gestion_livraison/screens/pages/profile.dart';
import 'package:gestion_livraison/screens/pages/setting.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screens = const [
    Dashboard(),
    Chat(),
    Profile(),
    Setting(),
    LivraisonMultiProvider()
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScreen = const Dashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[300],
        child: Icon(Icons.home, color: Colors.green[900]),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => const Home())));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[300],
        shape: const CircularNotchedRectangle(),
        notchMargin: 7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = const Dashboard();
                      currentTab = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.dashboard,
                        color:
                            currentTab == 0 ? Colors.green[900] : Colors.grey,
                      ),
                      Text(
                        'Acceuil',
                        style: TextStyle(
                            color: currentTab == 0 ? Colors.black : Colors.grey,
                            fontSize: 12),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = const LivraisonMultiProvider();
                      currentTab = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.motorcycle_rounded,
                        color:
                            currentTab == 1 ? Colors.green[900] : Colors.grey,
                      ),
                      Text(
                        'Livraison',
                        style: TextStyle(
                            color: currentTab == 1 ? Colors.black : Colors.grey,
                            fontSize: 12),
                      )
                    ],
                  ),
                ),
              ],
            ),
            // Right Tabs

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = const Profile();
                      currentTab = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color:
                            currentTab == 2 ? Colors.green[900] : Colors.grey,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                            color: currentTab == 2 ? Colors.black : Colors.grey,
                            fontSize: 12),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = const Setting();
                      currentTab = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings,
                        color:
                            currentTab == 3 ? Colors.green[900] : Colors.grey,
                      ),
                      Text(
                        'Setting',
                        style: TextStyle(
                            color: currentTab == 3 ? Colors.black : Colors.grey,
                            fontSize: 12),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
