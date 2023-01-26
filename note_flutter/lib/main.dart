import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';
import 'home.dart';

/// 厦门大学计算机专业 | 前华为工程师
///  专注《零基础学编程系列》  http://lblbc.cn/blog
///  包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
///  公众号：蓝不蓝编程
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '蓝不蓝编程',
      debugShowCheckedModeBanner: false,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate
      ],
      home: const MyHomePage(),
    );
  }
}
