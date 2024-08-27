class RegistrationModel {
  final String fullname;
  final String email;
  final String password;

  RegistrationModel({
    required this.fullname,
    required this.email,
    required this.password,
  });

  // Convert a JSON map into a LoginModel object
  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
    return RegistrationModel(
      fullname: json['full_name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  // Convert a LoginModel object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'full_name': fullname,
      'email': email,
      'password': password,
    };
  }
}
