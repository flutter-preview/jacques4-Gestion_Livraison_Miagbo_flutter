import 'dart:convert';

class Fournisseur {
  int id;
  String nom;
  String prenom;
  String tel;
  String email;
  String residence;
  String longitude;
  String latitude;

  Fournisseur({
    this.id = 0,
    required this.nom,
    required this.prenom,
    required this.tel,
    required this.email,
    required this.residence,
    required this.latitude,
    required this.longitude,
  });

  factory Fournisseur.fromJson(Map<String, dynamic> json) {
    return Fournisseur(
        id: json['id'],
        nom: json['nom'],
        prenom: json['prenom'],
        tel: json['tel'],
        email: json['email'],
        residence: json['residence'],
        latitude: json['latitude'],
        longitude: json['longitude']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'tel': tel,
      'email': email,
      'residence': residence,
      'latitude': latitude,
      'longitude': longitude
    };
  }

  @override
  String toString() {
    return "Fournisseurs{id : $id,nom :$nom, prenom:$prenom, tel:$tel, email:$email,residence:$residence,latitude:$latitude,longitude:$longitude}";
  }
}

List<Fournisseur> fournisseurFromJson(String strJson) {
  final str = json.decode(strJson);
  return List<Fournisseur>.from(str.map((item) {
    return Fournisseur.fromJson(item);
  }));
}

String fournisseurToJson(Fournisseur data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}
