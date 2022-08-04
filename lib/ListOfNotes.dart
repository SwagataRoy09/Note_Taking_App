import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:notesapp/NoteContent.dart';
import 'package:notesapp/Warning.dart';

class ListOfNotes extends StatelessWidget {
  final reference = FirebaseDatabase.instance.ref().orderByChild('date');
  List<String> keys=[];
  List<Color> colors = [
    Color(0xffefdada),
    Color(0xffefe6e9),
    Color(0xfff9f0fa),
    Color(0xfff1eef5),
    Color(0xfff8fae2),
    Color(0xfffffcf2),
    Color(0xfffff3ef)
  ];
  ListOfNotes({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
            body: Container(
      height: double.infinity,
      child: FirebaseAnimatedList(
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          Map notes = snapshot.value as Map;
          for(DataSnapshot i in snapshot.children ) {
            keys.add(i.key.toString());
            break;
          }
          return _buildList(context, notes: (notes));
        },
        query: reference,
      ),
    )));
  }

  Widget _buildList(BuildContext context, {required Map notes}) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: colors[Random().nextInt(colors.length)],
          ),
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  title: Text(notes['NoteTitle'],
                      style: TextStyle(
                          fontFamily: 'Graduate',
                          fontSize: 10,
                          color: Color(0xff191176),
                          fontWeight: FontWeight.bold)),
                  subtitle: Text(notes['editted'],
                      style: TextStyle(
                          color: Color(0xff191176),
                          fontFamily: 'Graduate',
                          fontSize: 10,
                          fontWeight: FontWeight.bold)),
                  tileColor: colors[Random().nextInt(colors.length)],
                  onLongPress: () {
                    showAnimatedDialog(
                        animationType: DialogTransitionType.slideFromTop,
                        curve: Curves.easeInOutCubicEmphasized,
                        duration: Duration(seconds: 1),
                        context: (context),
                        builder: (builder) => Warning(
                              NoteTitle: notes['NoteTitle'],
                            ));
                  },
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NoteContents(
                              NoteTitle: notes['NoteTitle'],
                              NoteContent: notes['NoteContent'],
                          list:keys,
                            )));
                  },
                ),
                SizedBox(
                  height: 8,
                ),
              ]),
        ));
  }
}
