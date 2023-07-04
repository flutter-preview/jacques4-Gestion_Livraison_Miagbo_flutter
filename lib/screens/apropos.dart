import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Retour en arriere
          centerTitle: true,
          backgroundColor: Colors.green[900],
          title: const Text(
            'Service Livraison',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 250),
                Image.asset("assets/images/miagbo_image.jpeg",
                    height: 75, width: 200),
                SizedBox(height: 30),
                Text(' A propos du service Livraison Miagbo'),
                Text(" Version: 1.0.0")
              ],
            ),
          ),
        ));
  }
}
