import 'package:flutter/material.dart';
import 'package:gestion_livraison/controllers/FournisseurController.dart';
import 'package:gestion_livraison/models/Fournisseur.dart';
import 'package:provider/provider.dart';

class FournisseurListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fournisseurProvider = Provider.of<FournisseurProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des fournisseurs'),
      ),
      body: FutureBuilder<List<Fournisseur>>(
        future: fournisseurProvider.getFournisseur(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erreur : ${snapshot.error}');
          } else {
            final fournisseurs = snapshot.data;
            var response = snapshot.data as List<Fournisseur>;
            print(response);
            return ListView.builder(
              itemCount: fournisseurs!.length,
              itemBuilder: (context, index) {
                final fournisseur = fournisseurs[index];
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ListTile(
                        title: Text(fournisseur.nom),
                        subtitle: Text(fournisseur.prenom),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  FournisseurDetailsScreen(fournisseur),
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UpdateFournisseurScreen(
                                                fournisseur),
                                      ),
                                    );
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddFournisseurScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class FournisseurDetailsScreen extends StatelessWidget {
  final Fournisseur fournisseur;

  FournisseurDetailsScreen(this.fournisseur);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails du fournisseur'),
      ),
      body: Column(
        children: [
          Text('Nom: ${fournisseur.nom}'),
          Text('Prenom: ${fournisseur.prenom}'),
          Text('Email: ${fournisseur.email}'),
          Text('Telephone: ${fournisseur.tel}'),
          Text('Residence: ${fournisseur.residence}'),
          Text('Latitude: ${fournisseur.latitude}'),
          Text('Longitude: ${fournisseur.longitude}'),
          ElevatedButton(
            onPressed: () {
              Provider.of<FournisseurProvider>(context, listen: false)
                  .deleteFournisseur(fournisseur.id);
              Navigator.pop(context);
            },
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  }
}

class AddFournisseurScreen extends StatelessWidget {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final TextEditingController residenceController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un Fournisseur'),
      ),
      body: Column(
        children: [
          TextField(
            controller: nomController,
            decoration: const InputDecoration(labelText: 'Nom'),
          ),
          TextField(
            controller: prenomController,
            decoration: const InputDecoration(labelText: 'Prenom'),
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: telController,
            decoration: const InputDecoration(labelText: 'Telephone'),
          ),
          TextField(
            controller: residenceController,
            decoration: const InputDecoration(labelText: 'Residence'),
          ),
          TextField(
            controller: longitudeController,
            decoration: const InputDecoration(labelText: 'Longitude'),
          ),
          TextField(
            controller: latitudeController,
            decoration: const InputDecoration(labelText: 'Latitude'),
          ),
          ElevatedButton(
            onPressed: () {
              final newFournisseur = Fournisseur(
                nom: nomController.text,
                prenom: prenomController.text,
                email: emailController.text,
                tel: telController.text,
                longitude: double.parse(longitudeController.text),
                residence: longitudeController.text,
                latitude: double.parse(latitudeController.text),
              );
              Provider.of<FournisseurProvider>(context, listen: false)
                  .addFournisseur(newFournisseur);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FournisseurListScreen()));
            },
            child: const Text('Ajouter'),
          ),
        ],
      ),
    );
  }
}

class UpdateFournisseurScreen extends StatelessWidget {
  final Fournisseur fournisseur;

  UpdateFournisseurScreen(this.fournisseur);

  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final TextEditingController residenceController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nomController.text = fournisseur.nom;
    prenomController.text = fournisseur.prenom;
    emailController.text = fournisseur.email;
    telController.text = fournisseur.tel;
    residenceController.text = fournisseur.residence;
    longitudeController.text = fournisseur.longitude.toString();
    latitudeController.text = fournisseur.latitude.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis a jour d\'un Fournisseur'),
      ),
      body: Column(
        children: [
          TextField(
            controller: nomController,
            decoration: const InputDecoration(labelText: 'Nom'),
          ),
          TextField(
            controller: prenomController,
            decoration: const InputDecoration(labelText: 'Prenom'),
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: telController,
            decoration: const InputDecoration(labelText: 'Telephone'),
          ),
          TextField(
            controller: residenceController,
            decoration: const InputDecoration(labelText: 'Residence'),
          ),
          TextField(
            controller: longitudeController,
            decoration: const InputDecoration(labelText: 'Longitude'),
          ),
          TextField(
            controller: latitudeController,
            decoration: const InputDecoration(labelText: 'Latitude'),
          ),
          ElevatedButton(
            onPressed: () {
              final updatedFournisseur = Fournisseur(
                id: fournisseur.id,
                nom: nomController.text,
                prenom: prenomController.text,
                email: emailController.text,
                tel: telController.text,
                longitude: double.parse(longitudeController.text),
                residence: residenceController.text,
                latitude: double.parse(latitudeController.text),
              );

              Provider.of<FournisseurProvider>(context, listen: false)
                  .updateFournisseur(updatedFournisseur, fournisseur.id);
              Navigator.pop(context);
            },
            child: const Text('Ajouter'),
          ),
        ],
      ),
    );
  }
}
