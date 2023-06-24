class Livraison {
  int id;
  String date;
  bool status;
  double distance;
  String etat;
  dynamic commande;

  Livraison(
      {this.id = 0,
      required this.date,
      required this.status,
      required this.distance,
      required this.etat,
      required this.commande});

  factory Livraison.fromJson(Map<String, dynamic> json) {
    return Livraison(
        id: json['id'],
        date: json['date'],
        status: json['status'],
        distance: json['distance'],
        etat: json['etat'],
        commande: json['commande']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'status': status,
      'distance': distance,
      'etat': etat,
      'commande': commande,
    };
  }

  @override
  String toString() {
    return "Livraisons{id : $id, date:$date, status:$status,distance:$distance,etat:$etat,commande:$commande}";
  }
}
