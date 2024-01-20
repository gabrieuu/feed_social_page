class UserModel {
  int id;
  String name;
  String username;
  String email;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "$id, $name, $username, $email";
  }
}
