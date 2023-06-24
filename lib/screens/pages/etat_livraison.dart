import 'package:flutter/material.dart';
import 'package:gestion_livraison/models/Livraison.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class EtatLivraison extends StatelessWidget {
  final Livraison livraison;

  EtatLivraison({required this.livraison});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: const Text(
          "Livraison Miagbo",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Text(
            'L\' Etat de Livraison',
            style: GoogleFonts.bebasNeue(fontSize: 40),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: const EdgeInsets.all(16),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        const AssetImage("assets/images/ramassage.jpg"),
                    child: TextButton(
                      child: const Text(
                        "Ramassage",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                      onPressed: () {
                        mettreAJourEtatLivraison(livraison.id, 'RAMASSAGE');
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        const AssetImage("assets/images/ramasse.jpg"),
                    child: TextButton(
                      child: const Text("Ramassé",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black)),
                      onPressed: () {
                        mettreAJourEtatLivraison(livraison.id, 'RAMASSE');
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        const AssetImage("assets/images/transi.jpeg"),
                    child: TextButton(
                      child: const Text("Transi",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black)),
                      onPressed: () {
                        mettreAJourEtatLivraison(livraison.id, 'TRANSI');
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        const AssetImage("assets/images/livraison.jpg"),
                    child: TextButton(
                      child: const Text("Livraison",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black)),
                      onPressed: () {
                        mettreAJourEtatLivraison(livraison.id, 'LIVRAISON');
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        const AssetImage("assets/images/livree.jpeg"),
                    child: TextButton(
                      child: const Text("Livré",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black)),
                      onPressed: () {
                        mettreAJourEtatLivraison(livraison.id, 'LIVRE');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> mettreAJourEtatLivraison(
      int livraisonId, String actionLivreur) async {
    String nouvelEtat;

    // Déterminez le nouvel état en fonction de l'action du livreur
    switch (actionLivreur) {
      case 'RAMASSAGE':
        nouvelEtat = 'RAMASSAGE';
        break;
      case 'RAMASSE':
        nouvelEtat = 'RAMASSE';
        break;
      case 'TRANSI':
        nouvelEtat = 'TRANSI';
        break;
      case 'LIVRAISON':
        nouvelEtat = 'LIVRAISON';
        break;
      case 'LIVRE':
        nouvelEtat = 'LIVRE';
        break;
      default:
        return; // Action invalide, ne faites rien
    }

    // Envoyer la requête PUT pour mettre à jour l'état de la commande
    try {
      await http.put(
          Uri.parse('http://192.168.1.72:8080/livraison/$livraisonId'),
          body: {'etat': nouvelEtat});

      print('L\'état de la livraison a été mis à jour avec succès.');
    } catch (e) {
      print('Erreur lors de la mise à jour de l\'état de la livraison : $e');
    }
  }
}
