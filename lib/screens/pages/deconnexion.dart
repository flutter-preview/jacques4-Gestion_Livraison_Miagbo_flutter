import 'package:flutter/material.dart';

class Deconnexion extends StatefulWidget {
  const Deconnexion({super.key});

  @override
  State<Deconnexion> createState() => _Deconnexion();
}

class _Deconnexion extends State<Deconnexion> {
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
      body: const Center(
          child: Text("Setting Screen", style: TextStyle(fontSize: 40))),
    );
  }
}
