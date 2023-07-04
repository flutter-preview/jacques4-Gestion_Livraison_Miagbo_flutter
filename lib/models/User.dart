class User {
  int id;
  String nom;
  String prenom;
  String tel;
  String email;
  String password;
  String residence;
  double longitude;
  double latitude;
  String userRole;

  User(
      {this.id = 0,
      required this.nom,
      required this.prenom,
      required this.tel,
      required this.email,
      required this.password,
      required this.residence,
      required this.latitude,
      required this.longitude,
      required this.userRole});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        nom: json['nom'],
        prenom: json['prenom'],
        tel: json['tel'],
        email: json['email'],
        password: json['password'],
        residence: json['residence'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        userRole: json['userRole']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'tel': tel,
      'email': email,
      'password': password,
      'residence': residence,
      'latitude': latitude,
      'longitude': longitude,
      'userRole': userRole
    };
  }

  @override
  String toString() {
    return "Users{id : $id,nom :$nom, prenom:$prenom, tel:$tel, email:$email,password:$password,residence:$residence,latitude:$latitude,longitude:$longitude,userRole:$userRole}";
  }
}
