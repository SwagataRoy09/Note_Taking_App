import 'package:flutter/material.dart';
import 'package:notesapp/AddNotesToList.dart';
import 'package:notesapp/Notes.dart';

import 'MainPage.dart';
class AddNotes extends StatefulWidget {

  AddNotes({Key? key}) : super(key: key);

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  late PageController _myPage;
  bool _validate=false;
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
   final messageDao = MessageDao();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  padding: const EdgeInsets.only(left: 18.0),
                  child: TextField(
                    enableInteractiveSelection: true,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.newline,
                    minLines:1,
                    decoration: InputDecoration(
                      errorText: (_validate)?'CANT BE NULL':null,
                      hintText: 'NOTE TITLE',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          fontFamily: 'Graduate', color: Color(0xffc3dbf0)),),
                    controller: _controller1,
                    autocorrect: false,
                    style: TextStyle(
                        fontFamily: 'Itim', color: Color(0xff191176)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: TextField(
                    enableInteractiveSelection: true,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.newline,
                    minLines:1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'NOTE CONTENT',
                      hintStyle: TextStyle(
                          fontFamily: 'Graduate', color: Color(0xffc3dbf0)),),
                    controller: _controller2,
                    style: TextStyle(
                        fontFamily: 'Itim', color: Color(0xff191176)),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.small(onPressed: () {
    setState(() {
      _controller1.text.isEmpty ? _validate = true : _validate = false;
      if(!_validate){
        add();
      }
    });
        },
          backgroundColor: Color(0xffeab9d6),
          hoverColor: Colors.white,
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Text('OK', style: TextStyle(fontFamily: 'Graduate',color: Color(0xffcd087c)),),),
      ),
    );
  }

  void add(){
    final message = NotesOfApp(_controller1.text,_controller2.text, DateTime.now(), DateTime.now(),DateTime.now().microsecondsSinceEpoch);
      messageDao.saveNotes(message);
    _controller1.clear();
    _controller2.clear();
  }
}
