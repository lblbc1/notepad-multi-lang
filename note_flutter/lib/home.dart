import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'generated/l10n.dart';
import 'pages/login.dart';
import 'pages/mine.dart';
import 'pages/note_list.dart';

/// 厦门大学计算机专业 | 前华为工程师
///  专注《零基础学编程系列》  http://lblbc.cn/blog
///  包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
///  公众号：蓝不蓝编程
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = [];

  @override
  initState() {
    super.initState();
    list
      ..add(NoteListPage(context))
      ..add(MinePage());
    checkLogin();
  }

  Future<void> checkLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(Constants.SP_KEY_TOKEN);
    if (token == null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: bottomNavigationColor,
              ),
              title: Text(
                S.of(context).home,
                style: TextStyle(color: bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: bottomNavigationColor,
              ),
              title: Text(
                S.of(context).mine,
                style: TextStyle(color: bottomNavigationColor),
              )),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
