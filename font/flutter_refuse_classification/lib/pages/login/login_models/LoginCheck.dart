class LoginCheck {
  LoginCheck({
    required this.loginCheck,
    required this.name,
  });
  late final String loginCheck;
  late final String name;

  LoginCheck.fromJson(Map<String, dynamic> json) {
    loginCheck = json['login_check'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['login_check'] = loginCheck;
    _data['name'] = name;
    return _data;
  }
}
