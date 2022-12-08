class User {
  final int id;
  final String name, email, password;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });
  factory User.fromJSON(Map parsedJson) {
    return User(
        id: parsedJson['id'],
        name: parsedJson['name'],
        email: parsedJson['email'],
        password: parsedJson['password']);
  }
}
