import 'package:flutter/material.dart';
import 'package:notesapp/Update.dart';
class NoteContents extends StatelessWidget {
  final String NoteContent;
  final String NoteTitle;
  final List<String> list;
  NoteContents({Key? key, required this.NoteContent, required this.NoteTitle, required this.list}) : super(key: key);
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
            child:Column(
              children: [
                ListTile(
                  onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UpdateNotes(NoteTitle: NoteTitle, NoteContent:NoteContent,list: list,)));},
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: Column(
                    children:[
                      Text('$NoteTitle',style:TextStyle(color: Color(0xff191176),fontFamily: 'Graduate',fontWeight: FontWeight.w500)),
                      SizedBox(height: 10),
                      Text('$NoteContent',style:TextStyle(color: Color(0xff191176),fontSize:12),),
                    ]),
                  ),
                  onLongPress: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UpdateNotes(NoteTitle: NoteTitle, NoteContent:NoteContent,list: list,)));},
                )
              ],
            ),)),
        floatingActionButton: FloatingActionButton.small(
          onPressed: () {
            // print(NoteTitle);
            // print(NoteContent);
            Navigator.of(context).pop();
          },
          backgroundColor: Color(0xffeab9d6),
          hoverColor: Colors.white,
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Text('BACK',
              style: TextStyle(
                  fontFamily: 'Graduate',
                  color: Color(0xffcd087c),
                  fontSize: 8)),
        ),
      ),
    );
  }
}
