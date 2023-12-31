import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gestion_livraison/GoogleMaps/order_traking_page.dart';
import 'package:gestion_livraison/controllers/LivraisonController.dart';
import 'package:gestion_livraison/models/Livraison.dart';
import 'package:gestion_livraison/screens/pages/etat_livraison.dart';
import 'package:gestion_livraison/screens/pages/qr_code.dart';
import 'package:provider/provider.dart';

class LivraisonListScreen extends StatefulWidget {
  const LivraisonListScreen({super.key});

  @override
  State<LivraisonListScreen> createState() => _LivraisonListScreenState();
}

class _LivraisonListScreenState extends State<LivraisonListScreen> {
  @override
  Widget build(BuildContext context) {
    final livraisonProvider = Provider.of<LivraisonProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: const Text(
          "Livraison Miagbo",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<Livraison>>(
        future: livraisonProvider.getLivraison(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            final error = snapshot.error;
            String erreur =
                "Une erreur s\'est produite Veuillez réessayer plus tard.";
            if (error is TimeoutException) {
              return Text(erreur);
            }
            return const Align(
                alignment: Alignment.center,
                child: Text("Erreur de recuperation des donnees de l'Api"));
          } else {
            final livraisons = snapshot.data;
            var response = snapshot.data as List<Livraison>;
            print(response);
            return ListView.builder(
              itemCount: livraisons!.length,
              itemBuilder: (context, index) {
                final livraison = livraisons[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  child: Container(
                    height: 100,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      title: Text(
                        livraison.commande['produit']['nomProduit'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.green[900]),
                      ),
                      subtitle: Text(livraison.commande['client']['nom']),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                LivraisonDetailsScreen(livraison),
                          ),
                        );
                      },
                      trailing: const SizedBox(
                        width: 100, // Largeur souhaitée pour les boutons
                        child: Row(
                          children: [
                            /* Expanded(
                              child: TextButton(
                                onPressed: () {},
                                child: Text('Modifier'),
                              ),
                            ),*/
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class LivraisonDetailsScreen extends StatelessWidget {
  final Livraison livraison;

  LivraisonDetailsScreen(this.livraison);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: const Text(
          "Livraison Miagbo",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: 600,
        height: 500,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white70,
            border: Border.all(color: Colors.green)),
        child: Column(
          children: [
            const SizedBox(height: 1),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(17)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => EtatLivraison(
                                      livraison: livraison,
                                    ))));
                      },
                      icon: Icon(
                        Icons.route,
                        color: Colors.green[900],
                      ),
                      label: Text("Suivi",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[900]))),
                  TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const QrCode())));
                      },
                      icon: Icon(
                        Icons.qr_code_sharp,
                        color: Colors.green[900],
                      ),
                      label: Text("Qr code",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[900]))),
                  TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => OrderTrackingPage(
                                      livraison: livraison,
                                    ))));
                      },
                      icon: Icon(
                        Icons.location_pin,
                        color: Colors.green[900],
                      ),
                      label: Text("Map",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[900]))),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '  Reference: ${livraison.commande['refCommand']}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                )),
            const SizedBox(height: 10),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('  Date livraison: ${livraison.date}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15))),
            const SizedBox(height: 5),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('  Distance: ${livraison.distance}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15))),
            const SizedBox(height: 5),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    '  Nom Client: ${livraison.commande['client']['name']}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15))),
            const SizedBox(height: 5),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    '  Prenom Client: ${livraison.commande['client']['prenom']}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15))),
            const SizedBox(height: 5),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    '  Adresse: ${livraison.commande['client']['residence']}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15))),
            const SizedBox(height: 5),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    '  Nom Produit: ${livraison.commande['produit']['nomProduit']}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15))),
            const SizedBox(height: 5),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    '  Description: ${livraison.commande['produit']['description']}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15))),
            const SizedBox(height: 5),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('  Quantite: ${livraison.commande['quantite']}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15))),
            const SizedBox(height: 5),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    '  Nom Vendeur: ${livraison.commande['produit']['fournisseur']['nom']}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15))),
            const SizedBox(height: 5),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    '  Prenom Vendeur: ${livraison.commande['produit']['fournisseur']['prenom']}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15))),
            const SizedBox(height: 5),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    '  Adresse: ${livraison.commande['produit']['fournisseur']['residence']}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15))),
            const SizedBox(height: 5),
            /*Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<LivraisonProvider>(context, listen: false)
                      .deleteLivraison(livraison.id);
                  Navigator.pop(context);
                },
                child: const Text('Supprimer'),
              ),
            ),*/
            const SizedBox(height: 70),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.motorcycle,
                  color: Colors.green[900],
                  size: 30,
                ),
                label: Text(
                  "Faire cette course",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900]),
                )),
          ],
        ),
      ),
    );
  }
}
