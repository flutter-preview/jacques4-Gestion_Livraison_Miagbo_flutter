import 'dart:convert';
import 'package:gestion_livraison/models/Livraison.dart';
import 'package:http/http.dart' as http;

class LivraisonApiService {
  String baseUrl = "http://192.168.1.72:8080";

  Future<List<Livraison>> getLivraison() async {
    final response = await http.get(Uri.parse("$baseUrl/livraisons"));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((data) => Livraison.fromJson(data)).toList();
    } else {
      throw Exception('Échec de la récupération des livraisons.');
    }
  }

  Future<void> addLivraison(Livraison livraison) async {
    final response = await http.post(
      Uri.parse('$baseUrl/livraison'),
      body: json.encode(livraison.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 201) {
      throw Exception('Échec de l\'ajout de la livraison.');
    }
  }

  Future<void> updateLivraison(Livraison livraison, int livraisonId) async {
    final url = '$baseUrl/livraison/${livraisonId}';
    final response = await http.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(livraison.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Échec de la mise à jour de la livraison.');
    }
  }

  Future<void> deleteLivraison(int livraisonId) async {
    final url = '$baseUrl/livraison/$livraisonId';
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Échec de la suppression de la livraison.');
    }
  }
}
