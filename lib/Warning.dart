import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
void check(String NoteTitle) async{
  print(NoteTitle);
  final reference = FirebaseDatabase.instance.ref();
  String key="";
  final snapshot = await FirebaseDatabase.instance.ref().get();
  for(DataSnapshot i in snapshot.children ){
    if(i.child('NoteTitle').value.toString()==NoteTitle) {
      key = i.key.toString();
      break;
    }
  }
  reference.child(key).remove();
}
class Warning extends StatelessWidget {
  Warning({Key? key, this.NoteTitle}) : super(key: key);
  final String? NoteTitle;
  @override
  Widget build(BuildContext context) {
    return ClassicGeneralDialogWidget(
        titleText: 'SURE WANT TO DELETE ?',
        onPositiveClick:(){
          check('$NoteTitle');
          Navigator.of(context).pop();
        } ,
        onNegativeClick: (){
          Navigator.of(context).pop();
        }
    );
  }
}
