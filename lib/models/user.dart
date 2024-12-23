class User {
  final int id;
  final String username;
  final String authProvider;

  User({
    required this.id,
    required this.username,
    required this.authProvider,
  });

  // Fungsi untuk mendeserialize JSON menjadi objek User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      authProvider: json['authProvider'],
    );
  }
}
