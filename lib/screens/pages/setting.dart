import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
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
