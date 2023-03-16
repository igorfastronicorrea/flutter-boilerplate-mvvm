class LoginResponseModel {
  String name;
  String email;
  String token;

  LoginResponseModel(
      {required this.name, required this.email, required this.token});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      name: json['name'],
      email: json['email'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'token': token,
      };
}
