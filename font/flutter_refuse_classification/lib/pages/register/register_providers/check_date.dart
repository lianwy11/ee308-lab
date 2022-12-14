/*
 *检测手机号
 */
String? vali_date_phone(value) {
  // 正则匹配手机号
  RegExp exp = RegExp(
      r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
  if (value.isEmpty) {
    return '用户名不能为空!';
  } else if (!exp.hasMatch(value)) {
    return '请输入正确手机号';
  }
  return null;
}

/*
 * 验证密码
 */
String? vali_date_PassWord(value) {
  if (value.isEmpty) {
    return '密码不能为空';
  } else if (value.trim().length < 6 || value.trim().length > 18) {
    return '密码长度不正确';
  }
  return null;
}

/*
 * 检测名字
 */
String? vali_date_name(value) {
  if (value.isEmpty) {
    return '名字不能为空';
  } else {
    return null;
  }
}
