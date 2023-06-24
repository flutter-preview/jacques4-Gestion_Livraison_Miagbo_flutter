class Produit {
  int id;
  String refProduit;
  String nomProduit;
  String description;
  double prix;
  double quantite;
  dynamic fournisseur;

  Produit(
      {this.id = 0,
      required this.refProduit,
      required this.nomProduit,
      required this.description,
      required this.prix,
      required this.quantite,
      required this.fournisseur});

  factory Produit.fromJson(Map<String, dynamic> json) {
    return Produit(
        id: json['id'],
        refProduit: json['refProduit'],
        nomProduit: json['nomProduit'],
        description: json['description'],
        prix: json['prix'],
        quantite: json['quantite'],
        fournisseur: json['fournisseur']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'refProduit': refProduit,
      'nomProduit': nomProduit,
      'description': description,
      'prix': prix,
      'quantite': quantite,
      'fournisseur': fournisseur
    };
  }

  @override
  String toString() {
    return "Produits{id : $id,refProduit :$refProduit, nomProduit:$nomProduit, description:$description, prix:$prix,quantite:$quantite,fournisseur:$fournisseur}";
  }
}
