import 'package:flutter/material.dart';
import 'package:gestion_livraison/models/Livraison.dart';

class EtatLivraison extends StatelessWidget {
  Livraison livraison;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "État de livraison",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text(" De \n Lome \n 19 Mai 2023"),
              const SizedBox(width: 200),
              Column(
                children: [
                  Row(
                    children: [
                      const Text("Livré à "),
                      Text(
                        livraison.commande['client']['residence'],
                        style: TextStyle(color: Colors.green[900]),
                      ),
                    ],
                  ),
                  const Text("Livraison prevu"),
                  const Text("  en attente")
                ],
              ),
            ],
          ),
          const SizedBox(height: 50),
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCircle(livraison.ramassage, 'Ramassage'),
                _buildLine(livraison.ramassage && livraison.ramasse),
                _buildCircle(livraison.ramasse, 'Ramasse'),
                _buildLine(livraison.ramasse && livraison.transi),
                _buildCircle(livraison.transi, 'Transi'),
                _buildLine(livraison.transi && livraison.livraison),
                _buildCircle(livraison.livraison, 'Livraison'),
                _buildLine(livraison.livraison && livraison.livrer),
                _buildCircle(livraison.livrer, 'Livrer'),
              ],
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  const SizedBox(height: 50),
                  const Text("Le parcours de votre distance vaut 15 Km\n"),
                  Row(
                    children: [
                      const Text("  Le livreur : "),
                      Text(livraison.commande['livreur']['name']),
                      const Text(" "),
                      Text(livraison.commande['livreur']['prenom']),
                      const Text(" est en charge de votre livraison"),
                      const SizedBox(
                        height: 60,
                      )
                    ],
                  ),
                  const Text(" Contact du livreur"),
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.phone),
                      label: Text(livraison.commande['livreur']['tel']))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCircle(bool isActive, String text) {
    Color color = isActive ? Colors.green : Colors.grey;
    return Column(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildLine(bool isActive) {
    Color color = isActive ? Colors.green : Colors.grey;
    return Expanded(
      child: Container(
        height: 5,
        color: color,
      ),
    );
  }
}
