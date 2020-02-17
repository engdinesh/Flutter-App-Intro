import 'dart:convert';

Client clientFromJson(String str) {
  final jsonData = json.decode(str);
  return Client.fromMap(jsonData);
}

String clientToJson(Client data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Client {
  int id;
  String name;
  String email;
  String mobile;
  String password;

  Client({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.password,
  });

  factory Client.fromMap(Map<String, dynamic> json) => new Client(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    password: json["password"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "email": email,
    "mobile": mobile,
    "password": password,
  };
}