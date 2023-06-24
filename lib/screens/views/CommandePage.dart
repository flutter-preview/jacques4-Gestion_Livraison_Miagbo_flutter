import 'package:flutter/material.dart';
import 'package:gestion_livraison/controllers/CommandeController.dart';
import 'package:gestion_livraison/models/Commande.dart';
import 'package:provider/provider.dart';

class CommandeListScreen extends StatefulWidget {
  const CommandeListScreen({super.key});

  @override
  State<CommandeListScreen> createState() => _CommandeListScreenState();
}

class _CommandeListScreenState extends State<CommandeListScreen> {
  @override
  Widget build(BuildContext context) {
    final commandeProvider = Provider.of<CommandeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des commandes'),
      ),
      body: FutureBuilder<List<Commande>>(
        future: commandeProvider.getCommande(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erreur : ${snapshot.error}');
          } else {
            final commandes = snapshot.data;
            var response = snapshot.data as List<Commande>;
            print(response);
            return ListView.builder(
              itemCount: commandes!.length,
              itemBuilder: (context, index) {
                final commande = commandes[index];
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ListTile(
                        title: Text(commande.refCommand),
                        subtitle: Text(commande.client['name']),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CommandeDetailsScreen(commande),
                            ),
                          );
                        },
                        trailing: Container(
                          width: 100, // Largeur souhaitée pour les boutons
                          child: Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UpdateFournisseurScreen(
                                                fournisseur),
                                      ),
                                    );*/
                                  },
                                  child: Text('Modifier'),
                                ),
                              ),
                            ],
                          ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCommandeScreen(),
            ),
          );*/
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CommandeDetailsScreen extends StatelessWidget {
  final Commande commande;

  CommandeDetailsScreen(this.commande);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails de la commande'),
      ),
      body: Column(
        children: [
          Text('Reference: ${commande.refCommand}'),
          Text('Quantite: ${commande.quantite}'),
          Text('Date: ${commande.date}'),
          Text('Status: ${commande.status}'),
          Text('Client: ${commande.client['name']}'),
          Text('Produit: ${commande.produit['nomProduit']}'),
          Text('Livreur: ${commande.livreur['name']}'),
          ElevatedButton(
            onPressed: () {
              Provider.of<CommandeProvider>(context, listen: false)
                  .deleteCommande(commande.id);
              Navigator.pop(context);
            },
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  }
}

/*class AddCommandeScreen extends StatelessWidget {
  final TextEditingController refCommandController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController quantiteController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController clientController = TextEditingController();
  final TextEditingController produitController = TextEditingController();
  final TextEditingController livreurController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter une commande'),
      ),
      body: Column(
        children: [
          TextField(
            controller: refCommandController,
            decoration: const InputDecoration(labelText: 'Ref commande'),
          ),
          TextField(
            controller: dateController,
            decoration: const InputDecoration(labelText: 'Date'),
          ),
          TextField(
            controller: quantiteController,
            decoration: const InputDecoration(labelText: 'Quantite'),
          ),
          TextField(
            controller: statusController,
            decoration: const InputDecoration(labelText: 'Status'),
          ),
          TextField(
            controller: clientController,
            decoration: const InputDecoration(labelText: 'Client'),
          ),
          TextField(
            controller: produitController,
            decoration: const InputDecoration(labelText: 'Produit'),
          ),
          TextField(
            controller: livreurController,
            decoration: const InputDecoration(labelText: 'Livreur'),
          ),
          ElevatedButton(
            onPressed: () {
              final newcommande = Commande(
                refCommand: refCommandController.text,
                quantite: quantiteController.text,
                date: dateController.text,
                status: statusController.text,
                client: clientController.text,
                produit: produitController.text,
                livreur: livreurController.text,
              );
              Provider.of<CommandeProvider>(context, listen: false)
                  .addCommande(newcommande);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CommandeListScreen()));
            },
            child: const Text('Ajouter'),
          ),
        ],
      ),
    );
  }
}*/
