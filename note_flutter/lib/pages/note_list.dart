import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lblbc_flutter/network/http_manager.dart';
import 'package:lblbc_flutter/pages/edit_note.dart';

import 'add_note.dart';

/// 厦门大学计算机专业 | 前华为工程师
///  专注《零基础学编程系列》  http://lblbc.cn/blog
///  包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
///  公众号：蓝不蓝编程
class NoteListPage extends StatelessWidget {
  final parentContext;

  const NoteListPage(this.parentContext, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '蓝不蓝云笔记',
      debugShowCheckedModeBanner: false,
      home: NoteListWidget(this.parentContext),
    );
  }
}

class NoteListWidget extends StatefulWidget {
  final parentContext;

  NoteListWidget(this.parentContext);

  @override
  createState() => _NoteListState();
}

class _NoteListState extends State<NoteListWidget> {
  List notes = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("蓝不蓝云笔记"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: gotoAddNotePage,
        tooltip: 'addNote',
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: getBody(),
      ),
    );
  }

  gotoAddNotePage() {
    Navigator.push(widget.parentContext, MaterialPageRoute(builder: (context) => AddNotePage()))
        .then((value) => loadData());
  }

  loadData() async {
    String url = "note/notes";
    HttpManager.getInstance().get(url).then((resp) {
      Map<String, dynamic> result = Map<String, dynamic>.from(resp);
      setState(() {
        notes = result['data'];
      });
    });
  }

  getItem(note) {
    var row = Container(
      margin: EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          onRowClick(note);
        },
        child: buildRow(note),
      ),
    );
    return Card(
      child: row,
    );
  }

  Row buildRow(note) {
    return Row(
      children: <Widget>[
        Expanded(
            child: Container(
          margin: const EdgeInsets.only(left: 8.0),
          height: 40.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                note['content'],
                style: const TextStyle(
                  fontSize: 18.0,
                ),
                maxLines: 1,
              ),
            ],
          ),
        ))
      ],
    );
  }

  getBody() {
    // if (notes.length != 0) {
    return ListView.builder(
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int position) {
          return getItem(notes[position]);
        });
    // }
  }

  onRowClick(note) {
    Navigator.push(widget.parentContext, MaterialPageRoute(builder: (context) => EditNotePage(noteId: note['id'])))
        .then((value) => loadData());
  }
}
