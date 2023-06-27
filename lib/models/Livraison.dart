class Livraison {
  int id;
  String date;
  bool status;
  double distance;
  bool ramassage;
  bool ramasse;
  bool transi;
  bool livraison;
  bool livrer;
  dynamic commande;

  Livraison(
      {this.id = 0,
      required this.date,
      required this.status,
      required this.distance,
      required this.ramassage,
      required this.ramasse,
      required this.transi,
      required this.livraison,
      required this.livrer,
      required this.commande});

  factory Livraison.fromJson(Map<String, dynamic> json) {
    return Livraison(
        id: json['id'],
        date: json['date'],
        status: json['status'],
        distance: json['distance'],
        ramassage: json['ramassage'],
        ramasse: json['ramasse'],
        transi: json['transi'],
        livraison: json['livraison'],
        livrer: json['livrer'],
        commande: json['commande']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'status': status,
      'distance': distance,
      'ramassage': ramassage,
      'ramasse': ramasse,
      'transi': transi,
      'livraison': livraison,
      'livrer': livrer,
      'commande': commande,
    };
  }

  @override
  String toString() {
    return "Livraisons{id : $id, date:$date, status:$status,distance:$distance,ramassage:$ramassage,ramasse:$ramasse,transi:$transi,livraison:$livraison,livrer:$livrer,commande:$commande}";
  }
}
