import 'package:flutter/material.dart';
import 'package:lblbc_flutter/generated/l10n.dart';

/// 厦门大学计算机专业 | 前华为工程师
///  专注《零基础学编程系列》  http://lblbc.cn/blog
///  包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
///  公众号：蓝不蓝编程
class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).mine),
      ),
      body: Center(
        child: Container(margin: const EdgeInsets.fromLTRB(20, 20, 20, 20), child: buildColumn(context)),
      ),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const CircleAvatar(backgroundColor: Colors.white, backgroundImage: AssetImage("assets/images/user_logo.png")),
        Text(
          S.of(context).lblbc,
          style: const TextStyle(fontSize: 15),
        ),
        const Expanded(child: Text("lblbc.cn")),
        Text(
          "©2023 " + S.of(context).lblbc,
          style: const TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
