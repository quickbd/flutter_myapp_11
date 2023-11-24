import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp_11/Controllers/note_controller.dart';
import 'package:myapp_11/Models/note_screen.dart';

class NoteScreen extends StatelessWidget {

  NoteScreen({Key? key}) : super(key: key);

      final Color brownColor = Colors.brown;
      final TextEditingController idCrt = TextEditingController();
      final TextEditingController nameCrt = TextEditingController();
      final TextEditingController dptCrt = TextEditingController();
      final NoteController noteController = NoteController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note'),
        backgroundColor: brownColor,
        elevation: 2.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showDialogue(context);
        },
        backgroundColor: brownColor,
        child: Icon(Icons.add),
      ),
      body: GetBuilder<NoteController>(builder: (_){
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.builder(
            shrinkWrap: true,
              itemCount: noteController.notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(
                    noteController.notes[index].id
                  ),
                  title: Text(
                      noteController.notes[index].name
                  ),
                  subtitle: Text(
                      noteController.notes[index].department
                  ),
                  trailing: Icon(Icons.arrow_forward)
                );

              }
          ),
        );
      },),
    );
  }

    _showDialogue(BuildContext context){
         return showDialog(context: context, builder: (_){
           return SingleChildScrollView(
             child: AlertDialog(
               content: Column(
                 children: [
                   TextField(
                     controller: idCrt,
                     decoration: InputDecoration(
                       hintText: 'Student ID'
                     ),
                   ),
                   SizedBox(height: 10.0,),
                   TextField(
                     controller: nameCrt,
                     decoration: InputDecoration(
                         hintText: 'Student Name'
                     ),
                   ),
                   SizedBox(height: 10.0,),
                   TextField(
                     controller: dptCrt,
                     decoration: InputDecoration(
                         hintText: 'Department'
                     ),
                   ),
                 ],
               ),
               actions: [
                 ElevatedButton(onPressed: (){
                   Navigator.pop(context);
                 }, child:Text('Cancel', style: TextStyle(
                   color: Colors.white
                 ),),
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.deepPurple
                 ),
                 ),
                 ElevatedButton(onPressed: (){
                   noteController.createNote(NoteModel(idCrt.text, nameCrt.text, dptCrt.text));
                   Navigator.pop(context);
                   
                 }, child:Text('Submit', style: TextStyle(
                     color: Colors.white
                 ),),
                   style: ElevatedButton.styleFrom(
                       backgroundColor: brownColor
                   ),
                 ),
               ],
             ),
           );

         });
  }

}
