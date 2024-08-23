class RegistrationModel {
  final String name;
  final String email;
  final String password;

  RegistrationModel({
    required this.name,
    required this.email,
    required this.password,
  });

  // Convert a JSON map into a LoginModel object
  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
    return RegistrationModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  // Convert a LoginModel object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
