import 'dart:convert';
import 'package:gestion_livraison/models/Fournisseur.dart';
import 'package:http/http.dart' as http;

class FournisseurApiService {
  String baseUrl = "http://127.0.0.1:8080";

  Future<List<Fournisseur>> getFournisseur() async {
    final response = await http.get(Uri.parse("$baseUrl/fournisseurs"));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((data) => Fournisseur.fromJson(data)).toList();
    } else {
      throw Exception('Échec de la récupération des fournisseurs.');
    }
  }

  Future<void> addFournisseur(Fournisseur fournisseur) async {
    final response = await http.post(
      Uri.parse('$baseUrl/fournisseur'),
      body: json.encode(fournisseur.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 201) {
      throw Exception('Échec de l\'ajout du fournisseur.');
    }
  }

  Future<void> updateFournisseur(
      Fournisseur fournisseur, int fournisseurId) async {
    final url = '$baseUrl/fournisseur/${fournisseurId}';
    final response = await http.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(fournisseur.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Échec de la mise à jour du fournisseur.');
    }
  }

  Future<void> deleteFournisseur(int fournisseurId) async {
    final url = '$baseUrl/fournisseur/$fournisseurId';
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Échec de la suppression du fournisseur.');
    }
  }
}
