import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false, // Retour en arriere
          centerTitle: true,
          backgroundColor: Colors.green[900],
          title: const Text(
            'Service Livraison',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          )),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/miagbo_image.jpeg",
                      height: 75, width: 200, alignment: Alignment.bottomLeft),
                  const Icon(
                    Icons.notifications,
                    size: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/images/livreur.jpg",
                      height: 200, width: 300),
                  Row(
                    children: [
                      const Text(
                        "Bienvenu au service livraison ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        "Miagbo",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.green[900]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Container(
              width: 300,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(16)),
              child: const Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Image.asset("assets/images/livreur.jpg",height: 200, width: 300),
                  Row(
                    children: [
                      Text(
                        "Recherchez les livraisons \n dispobiles choisisez en un\n et faite votre course.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
