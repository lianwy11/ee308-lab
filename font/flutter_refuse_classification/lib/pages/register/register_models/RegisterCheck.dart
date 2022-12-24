class RegisterCheck {
  RegisterCheck({
    required this.registerCheck,
    required this.name,
  });
  late final String registerCheck;
  late final String name;

  RegisterCheck.fromJson(Map<String, dynamic> json) {
    registerCheck = json['register_check'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['register_check'] = registerCheck;
    _data['name'] = name;
    return _data;
  }
}
