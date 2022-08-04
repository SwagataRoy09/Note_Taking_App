import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:notesapp/Warning2.dart';
class UpdateNotes extends StatelessWidget {
  final String NoteTitle, NoteContent;
  final List<String> list;
  UpdateNotes({Key? key, required this.NoteTitle, required this.NoteContent,required this.list})
      : super(key: key);
  final controller1 = TextEditingController(),
      controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    controller1.text = '$NoteTitle';
    controller2.text = '$NoteContent';
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffe9f1f2),
          shadowColor: Color(0xffe9f1f2),
        ),
        body: Center(
          child: Container(
            height: 500,
            width: 300,
            decoration: BoxDecoration(
              color: Color(0xffe1e9f0),
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Color(0xff191176)),
                    controller: controller1,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    minLines: 1,
                    maxLines: 500,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Color(0xff191176)),
                    controller: controller2,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.small(
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            backgroundColor: Color(0xffeab9d6),
            hoverColor: Colors.white,
            onPressed: () {
              showAnimatedDialog(
                  animationType: DialogTransitionType.fade,
                  curve: Curves.easeInOutCubicEmphasized,
                  duration: Duration(seconds: 1),
                  context: (context),
                  builder: (builder) => Warning2(
                        NoteTitle: controller1.text,
                        NoteContent: controller2.text,
                    list: list,
                      ));
            },
          child: Text('SAVE',
              style: TextStyle(
                  fontFamily: 'Graduate',
                  color: Color(0xffcd087c),
                  fontSize: 8)),),
      ),
    );
  }
}
