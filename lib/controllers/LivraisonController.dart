import 'package:flutter/foundation.dart';
import 'package:gestion_livraison/models/Livraison.dart';
import 'package:gestion_livraison/services/LivraisonService.dart';

class LivraisonProvider extends ChangeNotifier {
  final LivraisonApiService _apiService = LivraisonApiService();
  List<Livraison> _livraisons = [];

  List<Livraison> get livraisons => _livraisons;

  Future<List<Livraison>> getLivraison() async {
    _livraisons = await _apiService.getLivraison();
    return _livraisons;
  }

  Future<void> addLivraison(Livraison livraison) async {
    await _apiService.addLivraison(livraison);
    _livraisons = await _apiService.getLivraison();
    notifyListeners();
  }

  Future<void> updateLivraison(Livraison livraison, int livraisonId) async {
    await _apiService.updateLivraison(livraison, livraisonId);
    _livraisons = await _apiService.getLivraison();
    notifyListeners();
  }

  Future<void> deleteLivraison(int livraisonId) async {
    await _apiService.deleteLivraison(livraisonId);
    _livraisons = await _apiService.getLivraison();
    notifyListeners();
  }
}
