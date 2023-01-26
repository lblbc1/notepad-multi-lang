import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import 'package:lblbc_flutter/constants.dart';
import 'package:lblbc_flutter/generated/l10n.dart';
import 'package:lblbc_flutter/network/http_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 厦门大学计算机专业 | 前华为工程师
///  专注《零基础学编程系列》  http://lblbc.cn/blog
///  包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
///  公众号：蓝不蓝编程
class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(margin: EdgeInsets.fromLTRB(20, 20, 20, 20), child: buildColumn()),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 200,
          child: TextField(
            style: const TextStyle(fontSize: 20),
            decoration: InputDecoration(
              hintText: S.of(context).input_user_name,
            ),
            onChanged: (val) {
              name = val;
            },
          ),
        ),
        SizedBox(
          width: 200,
          child: TextField(
            style: const TextStyle(fontSize: 20),
            obscureText: true,
            decoration: InputDecoration(
              hintText: S.of(context).input_password,
            ),
            onChanged: (val) {
              password = val;
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: Row(
            children: [
              const Spacer(),
              ElevatedButton(
                child: Text(S.of(context).login),
                onPressed: () {
                  login();
                },
              ),
              const Spacer(),
              ElevatedButton(
                child: Text(S.of(context).register),
                onPressed: () {
                  register();
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }

  login() async {
    String url = "user/login";
    HttpManager.getInstance().post(url, data: {"name": name, "password": password}).then((resp) async {
      if (resp['code'] == 0) {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString(Constants.SP_KEY_TOKEN, resp['data']['token']);
        Navigator.pop(context);
      } else {
        FToast.toast(context, msg: resp['msg']);
      }
    });
  }

  register() async {
    String url = "user/register";
    HttpManager.getInstance().post(url, data: {"name": name, "password": password}).then((resp) async {
      if (resp['code'] == 0) {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString(Constants.SP_KEY_TOKEN, resp['data']['token']);
        Navigator.pop(context);
      } else {
        FToast.toast(context, msg: resp['msg']);
      }
    });
  }
}
