class User {
  final String? id;
  final String email;
  final String name;
  final String? role;

  User({
    this.id,
    required this.email,
    required this.name,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? json['id'],
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      if (role != null) 'role': role,
    };
  }
}
