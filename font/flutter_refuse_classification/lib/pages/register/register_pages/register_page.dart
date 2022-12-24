import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/pages/register/register_providers/check_date.dart';
import 'package:flutter_refuse_classification/pages/register/register_providers/register_info_sent.dart';
import 'package:flutter_refuse_classification/pages/register/register_views/register_button.dart';
import 'package:flutter_refuse_classification/pages/register/register_views/register_text_form_field.dart';
import 'package:flutter_refuse_classification/pages/register/register_views/title_area.dart';

class register_page extends StatefulWidget {
  register_page({Key? key}) : super(key: key);

  @override
  _register_pageState createState() => _register_pageState();
}

class _register_pageState extends State<register_page> {
  //表单状态
  GlobalKey<FormState> _re_formKey = GlobalKey<FormState>();

  //注册信息
  var _name = "";
  var _user_phone = "122";
  var _password = "";

  //焦点
  FocusNode _focusNodeUserName = new FocusNode();
  FocusNode _focusNodePassWord = new FocusNode();
  FocusNode _focusNodePhoneNum = new FocusNode();

  /*
   *输入框
   */
  Widget _register_input(
          String register_info,
          FocusNode focus,
          String? Function(String?)? validator,
          void Function(String?)? onSaved) =>
      Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "    " + register_info,
              style: TextStyle(color: Colors.grey[400], fontSize: 15),
              textAlign: TextAlign.left,
            ),
            register_text_form_field(
              register_info: register_info,
              focusNode: focus,
              validator: validator,
              onSaved: onSaved,
            )
          ],
        ),
      );

  /*
   *表单
   */
  Widget _get_form() => Form(
      key: _re_formKey,
      child: Column(
        children: [
          _register_input("用户名", _focusNodeUserName, vali_date_name,
              (String? value) {
            _name = value!;
          }),
          _register_input("电话号码", _focusNodePhoneNum, vali_date_phone,
              (String? value) {
            _user_phone = value!;
          }),
          _register_input("密码", _focusNodePassWord, vali_date_PassWord,
              (String? value) {
            _password = value!;
          })
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _focusNodeUserName.unfocus();
          _focusNodePassWord.unfocus();
          _focusNodePhoneNum.unfocus();
        },
        child: ListView(
          children: [
            Container(
              height: 30,
            ),
            title_area(),
            Container(
              height: 30,
            ),
            Container(
              child: _get_form(),
            ),
            Container(height: 50),
            Container(
              height: 63,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: register_button(
                onPressed: () {
                  _focusNodeUserName.unfocus();
                  _focusNodePassWord.unfocus();
                  _focusNodePhoneNum.unfocus();

                  if (_re_formKey.currentState!.validate()) {
                    //只有输入通过验证，才会执行这里
                    _re_formKey.currentState!.save();
                    //todo 登录操作
                    print("--------------");
                    print("    名字 :" + _name);
                    print("电话号码 :" + _user_phone);
                    print("密码:" + _password);

                    //验证注册信息是否正确,是否重复

                    //注册完直接登录，进入主页面

                    register_info_sent(_name, _user_phone, _password);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
