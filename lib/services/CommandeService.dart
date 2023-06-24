import 'dart:convert';
import 'package:gestion_livraison/models/Commande.dart';
import 'package:http/http.dart' as http;

class CommandeApiService {
  String baseUrl = "http://127.0.0.1:8080";

  Future<List<Commande>> getCommande() async {
    print("un");
    final response = await http.get(Uri.parse("$baseUrl/commandes"));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((data) => Commande.fromJson(data)).toList();
    } else {
      print("deux");
      throw Exception('Échec de la récupération des commandes.');
    }
  }

  Future<void> addCommande(Commande commande) async {
    final response = await http.post(
      Uri.parse('$baseUrl/commande'),
      body: json.encode(commande.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 201) {
      throw Exception('Échec de l\'ajout de la commande.');
    }
  }

  Future<void> updateCommande(Commande commande, int commandeId) async {
    final url = '$baseUrl/commande/${commandeId}';
    final response = await http.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(commande.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Échec de la mise à jour de la commande.');
    }
  }

  Future<void> deleteCommande(int commandeId) async {
    final url = '$baseUrl/commande/$commandeId';
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Échec de la suppression de la commande.');
    }
  }
}
