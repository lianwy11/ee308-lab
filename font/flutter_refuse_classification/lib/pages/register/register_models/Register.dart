class Register {
  Register({
    required this.state,
    required this.name,
    required this.user_phone,
    required this.password,
  });
  late final String state;
  late final String name;
  late final String user_phone;
  late final String password;

  Register.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    name = json['name'];
    user_phone = json['user_phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['state'] = state;
    _data['name'] = name;
    _data['user_phone'] = user_phone;
    _data['password'] = password;
    return _data;
  }
}
