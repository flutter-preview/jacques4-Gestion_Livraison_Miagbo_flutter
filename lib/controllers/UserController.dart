import 'package:flutter/foundation.dart';
import 'package:gestion_livraison/models/User.dart';
import 'package:gestion_livraison/services/UserService.dart';

class UserProvider extends ChangeNotifier {
  final UserApiService _apiService = UserApiService();
  List<User> _users = [];

  List<User> get users => _users;

  Future<List<User>> getUser() async {
    _users = await _apiService.getUser();
    return _users;
  }

  Future<void> addUser(User user) async {
    await _apiService.addUser(user);
    _users = await _apiService.getUser();
    notifyListeners();
  }

  Future<void> updateUser(User user, int userId) async {
    await _apiService.updateUser(user, userId);
    _users = await _apiService.getUser();
    notifyListeners();
  }

  Future<void> deleteUser(int userId) async {
    await _apiService.deleteUser(userId);
    _users = await _apiService.getUser();
    notifyListeners();
  }
}
