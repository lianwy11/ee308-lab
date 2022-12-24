class Login {
  Login({
    required this.state,
    required this.userPhone,
    required this.password,
  });
  late final String state;
  late final String userPhone;
  late final String password;

  Login.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    userPhone = json['user_phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['state'] = state;
    _data['user_phone'] = userPhone;
    _data['password'] = password;
    return _data;
  }
}
