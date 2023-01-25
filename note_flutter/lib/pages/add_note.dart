import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lblbc_flutter/network/http_manager.dart';

/// 厦门大学计算机专业 | 前华为工程师
///  专注《零基础学编程系列》  http://lblbc.cn/blog
///  包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
///  公众号：蓝不蓝编程
class AddNotePage extends StatefulWidget {
  AddNotePage({Key? key}) : super(key: key);

  @override
  createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  TextEditingController _contentController = TextEditingController();
  String content = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        Expanded(
            child: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: 10,
          decoration: const InputDecoration(
            hintText: "请输入正文",
          ),
          controller: _contentController,
        )),
        ElevatedButton(
          child: Text("保存"),
          onPressed: () {
            addNote();
          },
        ),
      ],
    );
  }

  addNote() async {
    String url = "note/notes";
    String content = _contentController.text;
    HttpManager.getInstance().post(url, data: {"content": content}).then((resp) {
      Navigator.pop(context);
    });
  }
}
