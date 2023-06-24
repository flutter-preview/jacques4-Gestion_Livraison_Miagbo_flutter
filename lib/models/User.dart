class User {
  int id;
  String name;
  String prenom;
  String tel;
  String email;
  String password;
  String residence;
  String longitude;
  String latitude;
  String userRole;

  User(
      {this.id = 0,
      required this.name,
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
        name: json['name'],
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
      'name': name,
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
    return "Users{id : $id,name :$name, prenom:$prenom, tel:$tel, email:$email,password:$password,residence:$residence,latitude:$latitude,longitude:$longitude,userRole:$userRole}";
  }
}
