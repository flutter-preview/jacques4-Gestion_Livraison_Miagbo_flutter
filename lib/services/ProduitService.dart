import 'dart:convert';
import 'package:gestion_livraison/models/Produit.dart';
import 'package:http/http.dart' as http;

class ProduitApiService {
  String baseUrl = "http://127.0.0.1:8080";

  Future<List<Produit>> getProduit() async {
    final response = await http.get(Uri.parse("$baseUrl/produits"));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((data) => Produit.fromJson(data)).toList();
    } else {
      throw Exception('Échec de la récupération des produits.');
    }
  }

  Future<void> addProduit(Produit produit) async {
    final response = await http.post(
      Uri.parse('$baseUrl/produit'),
      body: json.encode(produit.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 201) {
      throw Exception('Échec de l\'ajout du produit.');
    }
  }

  Future<void> updateProduit(Produit produit, int produitId) async {
    final url = '$baseUrl/produit/${produitId}';
    final response = await http.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(produit.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Échec de la mise à jour du produit.');
    }
  }

  Future<void> deleteProduit(int produitId) async {
    final url = '$baseUrl/produit/$produitId';
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Échec de la suppression du produit.');
    }
  }
}
