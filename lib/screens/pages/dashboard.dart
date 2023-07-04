import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gestion_livraison/screens/apropos.dart';
import 'package:gestion_livraison/screens/carouselCard.dart';
import 'package:url_launcher/url_launcher.dart';

class Dashboard extends StatelessWidget {
  List<String> carouselImageItems = [
    'assets/images/livraison.jpg',
    'assets/images/livreur.jpg',
    'assets/images/ramasse.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Retour en arriere
        centerTitle: true,
        backgroundColor: Colors.green[900],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => const About())));
                },
                icon: const Icon(
                  Icons.info,
                  color: Colors.white,
                )),
            const Text(
              'Service Livraison',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            IconButton(
              onPressed: () async {
                String message =
                    "Bonjour, veuillez vous présentez et nous donnez l'objet de votre message.";
                String phoneNumber = "70361613"; // Numéro de téléphone WhatsApp

                String url =
                    "https://wa.me/$phoneNumber/?text=${Uri.encodeFull(message)}";
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw "Impossible d'ouvrir WhatsApp";
                }
              },
              icon: const Icon(
                Icons.phone,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Image.asset("assets/images/miagbo_image.jpeg",
                          height: 75,
                          width: 200,
                          alignment: Alignment.bottomLeft),
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      '  Acceuil',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: IconButton(
                        icon: const Icon(
                          Icons.notifications,
                          size: 27,
                        ),
                        onPressed: () {
                          // Actions when the right icon is pressed
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  constraints: const BoxConstraints(
                      maxWidth: 305), // Largeur maximale du conteneur
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Bienvenue au service livraison ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "Miagbo",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.green[900],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Container in container

              Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 320),
                  width: 500,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green[900],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 300,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.bottomLeft,
                              constraints: const BoxConstraints(maxWidth: 40),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.motorcycle,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 30),
                            const Text(
                              "Livreur en course à ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Miagbo",
                              style: TextStyle(
                                  color: Colors.green[900],
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "ASSIH Jacques",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Votre mission du jour",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.keyboard_double_arrow_down,
                    color: Colors.green[900],
                  ),
                  label: const Text(
                    "Nos missions",
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
          Positioned.fill(
            top: 300,
            child: Align(
              alignment: Alignment.center,
              child: CarouselSlider(
                items: carouselImageItems.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return CarouselCard(
                        imageUrl: item,
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  // height: 500,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
