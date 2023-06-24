import 'package:flutter/foundation.dart';
import 'package:gestion_livraison/models/Produit.dart';
import 'package:gestion_livraison/services/ProduitService.dart';

class ProduitProvider extends ChangeNotifier {
  final ProduitApiService _apiService = ProduitApiService();
  List<Produit> _produits = [];

  List<Produit> get produits => _produits;

  Future<List<Produit>> getProduit() async {
    _produits = await _apiService.getProduit();
    return _produits;
  }

  Future<void> addProduit(Produit produit) async {
    await _apiService.addProduit(produit);
    _produits = await _apiService.getProduit();
    notifyListeners();
  }

  Future<void> updateProduit(Produit produit, int produitId) async {
    await _apiService.updateProduit(produit, produitId);
    _produits = await _apiService.getProduit();
    notifyListeners();
  }

  Future<void> deleteProduit(int produitId) async {
    await _apiService.deleteProduit(produitId);
    _produits = await _apiService.getProduit();
    notifyListeners();
  }
}
