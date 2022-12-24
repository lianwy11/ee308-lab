import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/pages/login/login_providers/login_info_sent.dart';
import 'package:flutter_refuse_classification/pages/login/login_views/bottom_area.dart';
import 'package:flutter_refuse_classification/pages/login/login_views/login_button_area.dart';
import 'package:flutter_refuse_classification/pages/login/login_views/user_name_text_form_field.dart';
import 'package:get/get.dart';
import '../../../config/routers/RouteConfig.dart';
import 'package:fluttertoast/fluttertoast.dart';

class login_page extends StatefulWidget {
  login_page({Key? key}) : super(key: key);

  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  //焦点
  FocusNode _focusNodeUserName = new FocusNode();
  FocusNode _focusNodePassWord = new FocusNode();

  //用户名输入框控制器，此控制器可以监听用户名输入框操作
  TextEditingController _userNameController = new TextEditingController();

  //表单状态
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _password = ''; //用户名
  var _username = ''; //密码
  var _isShowPwd = false; //是否显示密码
  var _isShowClear = false; //是否显示输入框尾部的清除按钮

  @override
  void initState() {
    //设置焦点监听
    _focusNodeUserName.addListener(_focusNodeListener);
    _focusNodePassWord.addListener(_focusNodeListener);
    //监听用户名框的输入改变
    _userNameController.addListener(() {
      print(_userNameController.text);

      // 监听文本框输入变化，当有内容的时候，显示尾部清除按钮，否则不显示
      if (_userNameController.text.length > 0) {
        setState(() {
          _isShowClear = true;
        });
      } else {
        setState(() {
          _isShowClear = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // 移除焦点监听
    _focusNodeUserName.removeListener(_focusNodeListener);
    _focusNodePassWord.removeListener(_focusNodeListener);
    _userNameController.dispose();
    super.dispose();
  }

  // 监听焦点
  Future<Null> _focusNodeListener() async {
    if (_focusNodeUserName.hasFocus) {
      print("用户名框获取焦点");
      // 取消密码框的焦点状态
      _focusNodePassWord.unfocus();
    }
    if (_focusNodePassWord.hasFocus) {
      print("密码框获取焦点");
      // 取消用户名框焦点状态
      _focusNodeUserName.unfocus();
    }
  }

  /**
   * 验证用户名
   */
  String? validateUserName(value) {
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

  /**
   * 验证密码
   */
  String? validatePassWord(value) {
    if (value.isEmpty) {
      return '密码不能为空';
    } else if (value.trim().length < 6 || value.trim().length > 18) {
      return '密码长度不正确';
    }
    return null;
  }

  //输入文本框区域
  Widget inputTextArea() => new Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white),
        child: new Form(
          key: _formKey,
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              user_name_text_form_field(
                controller: _userNameController,
                focusNode: _focusNodeUserName,
                isShowClear: _isShowClear,
                validator: validateUserName,
                onSaved: (String? value) {
                  _username = value!;
                },
              ),
              new TextFormField(
                focusNode: _focusNodePassWord,
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "请输入密码",
                    prefixIcon: Icon(Icons.lock),
                    // 是否显示密码
                    suffixIcon: IconButton(
                      icon: Icon((_isShowPwd)
                          ? Icons.visibility
                          : Icons.visibility_off),
                      // 点击改变显示或隐藏密码
                      onPressed: () {
                        setState(() {
                          _isShowPwd = !_isShowPwd;
                        });
                      },
                    )),
                obscureText: !_isShowPwd,
                //密码验证
                validator: validatePassWord,
                //保存数据
                onSaved: (String? value) {
                  _password = value!;
                },
              )
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // 外层添加一个手势，用于点击空白部分，回收键盘
      body: new GestureDetector(
        onTap: () {
          // 点击空白区域，回收键盘
          print("点击了空白区域");
          _focusNodePassWord.unfocus();
          _focusNodeUserName.unfocus();
        },
        child: new ListView(
          children: <Widget>[
            new SizedBox(height: 80),
            Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: Text(
                  "Logol",
                  style: TextStyle(color: Colors.white, fontSize: 34),
                ),
              ),
            ),
            // Container(
            //   height: 100,
            //   width: 100,
            //   color: Colors.blue,
            //   child: Center(
            //     child: Text(
            //       "Logol",
            //       style: TextStyle(color: Colors.white, fontSize: 50),
            //     ),
            //   ),
            // ),
            new SizedBox(height: 70),
            inputTextArea(),
            new SizedBox(height: 80),
            //
            //登录按钮
            //
            login_button_area(
              onPressed: () {
                //点击登录按钮，解除焦点，回收键盘
                _focusNodePassWord.unfocus();
                _focusNodeUserName.unfocus();

                if (_formKey.currentState!.validate()) {
                  //只有输入通过验证，才会执行这里
                  _formKey.currentState!.save();
                  //todo 登录操作
                  print("$_username + $_password");
                  login_info_sent(_username, _password);
                }
              },
            ),
            new SizedBox(height: 60),
            //
            //忘记密码  立即注册
            //
            bottom_area(
              onPressed: () {
                Get.offNamed(RouteConfig.register);
              },
            )
          ],
        ),
      ),
    );
  }
}
