import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false, // Retour en arriere
            centerTitle: true,
            backgroundColor: Colors.green[900],
            title: const Text(
              'Service Livraison',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            )),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage("assets/images/user.jpg"),
              ),
              const SizedBox(height: 20),
              // Nom Prenom
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 5),
                          color: Colors.green.withOpacity(.2),
                          spreadRadius: 2,
                          blurRadius: 10)
                    ]),
                child: const ListTile(
                  title: Text("Nom"),
                  subtitle: Text("ASSIH Jacques"),
                  leading: Icon(CupertinoIcons.person),
                  trailing: Icon(Icons.arrow_forward, color: Colors.grey),
                  tileColor: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              // Telephone
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 5),
                          color: Colors.green.withOpacity(.2),
                          spreadRadius: 2,
                          blurRadius: 10)
                    ]),
                child: const ListTile(
                  title: Text("Tel"),
                  subtitle: Text("228 70361613"),
                  leading: Icon(CupertinoIcons.phone),
                  trailing: Icon(Icons.arrow_forward, color: Colors.grey),
                  tileColor: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              // Adresse
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 5),
                          color: Colors.green.withOpacity(.2),
                          spreadRadius: 2,
                          blurRadius: 10)
                    ]),
                child: const ListTile(
                  title: Text("Adresse"),
                  subtitle: Text("Agoe legbassito"),
                  leading: Icon(CupertinoIcons.home),
                  trailing: Icon(Icons.arrow_forward, color: Colors.grey),
                  tileColor: Colors.white,
                ),
              ),
            ],
          ),
        ));
  }
}
