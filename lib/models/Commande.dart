class Commande {
  int id;
  String refCommand;
  int quantite;
  String date;
  bool status;
  dynamic client;
  dynamic livreur;
  dynamic produit;

  Commande(
      {this.id = 0,
      required this.refCommand,
      required this.quantite,
      required this.date,
      required this.status,
      required this.client,
      required this.produit,
      required this.livreur});

  factory Commande.fromJson(Map<String, dynamic> json) {
    return Commande(
        id: json['id'],
        refCommand: json['refCommand'],
        quantite: json['quantite'],
        date: json['date'],
        status: json['status'],
        client: json['client'],
        produit: json['produit'],
        livreur: json['livreur']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'refCommand': refCommand,
      'quantite': quantite,
      'date': date,
      'status': status,
      'client': client,
      'produit': produit,
      'livreur': livreur,
    };
  }

  @override
  String toString() {
    return "Commandes{id : $id,refCommand :$refCommand, quantite:$quantite, date:$date, status:$status,client:$client,produit:$produit,livreur:$livreur}";
  }
}
