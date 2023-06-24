import 'package:flutter/foundation.dart';
import 'package:gestion_livraison/models/Fournisseur.dart';
import 'package:gestion_livraison/services/fournisseurService.dart';

class FournisseurProvider extends ChangeNotifier {
  final FournisseurApiService _apiService = FournisseurApiService();
  List<Fournisseur> _fournisseurs = [];

  List<Fournisseur> get fournisseurs => _fournisseurs;

  Future<List<Fournisseur>> getFournisseur() async {
    _fournisseurs = await _apiService.getFournisseur();
    return _fournisseurs;
  }

  Future<void> addFournisseur(Fournisseur fournisseur) async {
    await _apiService.addFournisseur(fournisseur);
    _fournisseurs = await _apiService.getFournisseur();
    notifyListeners();
  }

  Future<void> updateFournisseur(
      Fournisseur fournisseur, int fournisseurId) async {
    await _apiService.updateFournisseur(fournisseur, fournisseurId);
    _fournisseurs = await _apiService.getFournisseur();
    notifyListeners();
  }

  Future<void> deleteFournisseur(int fournisseurId) async {
    await _apiService.deleteFournisseur(fournisseurId);
    _fournisseurs = await _apiService.getFournisseur();
    notifyListeners();
  }
}
