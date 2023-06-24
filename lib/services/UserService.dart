import 'dart:convert';
import 'package:gestion_livraison/models/User.dart';
import 'package:http/http.dart' as http;

class UserApiService {
  String baseUrl = "http://127.0.0.1:8080";

  Future<List<User>> getUser() async {
    final response = await http.get(Uri.parse("$baseUrl/users"));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((data) => User.fromJson(data)).toList();
    } else {
      throw Exception('Échec de la récupération des utilisateurs.');
    }
  }

  Future<void> addUser(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user'),
      body: json.encode(user.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 201) {
      throw Exception('Échec de l\'ajout de l\'utilisateur.');
    }
  }

  Future<void> updateUser(User user, int userId) async {
    final url = '$baseUrl/user/${userId}';
    final response = await http.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Échec de la mise à jour de l\'utilisateur.');
    }
  }

  Future<void> deleteUser(int userId) async {
    final url = '$baseUrl/user/$userId';
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Échec de la suppression de l\'utilisateur.');
    }
  }
}
