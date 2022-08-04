import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
class Warning2 extends StatelessWidget {
  final List<String> list;
  Warning2({Key? key, required this.NoteTitle, required this.NoteContent, required this.list}) : super(key: key);
  final String NoteTitle,NoteContent;
  @override
  Widget build(BuildContext context) {
    return ClassicGeneralDialogWidget(
      titleText: 'SURE WANT TO UPDATE ?',
      onPositiveClick:(){
      Update('$NoteTitle','$NoteContent',list);
      Navigator.of(context).pop();
    } ,
        onNegativeClick: (){
          Navigator.of(context).pop();
        }
    );
  }
}
Future<void> Update(String NoteTitle,String NoteContent,List<String> list) async {
  String key="";
  String result="";
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  final snapshot = await FirebaseDatabase.instance.ref().get();
  for(DataSnapshot i in snapshot.children ){
      key = i.key.toString();
      for(int i=0;i<list.length;i++){
        if(key==list[i]){
          result=list[i];
        }
      }
    }
  await ref.child(result).update({
    "NoteTitle":"$NoteTitle",
    "NoteContent":"$NoteContent",
    "editted":DateTime.now().toIso8601String().split('T').first,
  });
}