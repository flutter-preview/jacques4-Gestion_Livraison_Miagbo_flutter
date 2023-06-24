import 'package:flutter/foundation.dart';
import 'package:gestion_livraison/models/Commande.dart';
import 'package:gestion_livraison/services/CommandeService.dart';

class CommandeProvider extends ChangeNotifier {
  final CommandeApiService _apiService = CommandeApiService();
  List<Commande> _commandes = [];

  List<Commande> get commandes => _commandes;

  Future<List<Commande>> getCommande() async {
    _commandes = await _apiService.getCommande();
    return _commandes;
  }

  Future<void> addCommande(Commande commande) async {
    await _apiService.addCommande(commande);
    _commandes = await _apiService.getCommande();
    notifyListeners();
  }

  Future<void> updateCommande(Commande commandes, int commandeId) async {
    await _apiService.updateCommande(commandes, commandeId);
    _commandes = await _apiService.getCommande();
    notifyListeners();
  }

  Future<void> deleteCommande(int commandeId) async {
    await _apiService.deleteCommande(commandeId);
    _commandes = await _apiService.getCommande();
    notifyListeners();
  }
}
