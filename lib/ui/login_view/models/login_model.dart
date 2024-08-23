class LoginModel {
  final String email;
  final String password;

  LoginModel({
    required this.email,
    required this.password,
  });

  // Convert a JSON map into a LoginModel object
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  // Convert a LoginModel object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
