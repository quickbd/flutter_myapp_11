import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp_11/Controllers/note_controller.dart';
import 'package:myapp_11/Models/note_model.dart';

class NoteScreen extends StatelessWidget {

  NoteScreen({Key? key}) : super(key: key);

      final Color brownColor = Colors.brown;
      final TextEditingController idCrt = TextEditingController();
      final TextEditingController nameCrt = TextEditingController();
      final TextEditingController dptCrt = TextEditingController();
      final NoteController noteController = Get.put(NoteController());
      final Box box=Hive.box("notes");

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
          child: ValueListenableBuilder(
            valueListenable: box.listenable() ,

            builder: (context, box, child) {
              return ListView.builder(
                shrinkWrap: true,
                  itemCount: box.keys.length,
                  itemBuilder: (context, index) {

                  NoteModel note=box.getAt(index);
                    return Card(
                      child: ListTile(
                        leading: Text(
                          note.id
                        ),
                        title: Text(
                            note.name
                        ),
                        subtitle: Text(
                            note.department
                        ),
                        trailing: Container(
                          width: 100.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: (){
                                  _updateDialogue(context, index);
                                    
                                },
                                child: Icon(Icons.edit),
                              ),
                              InkWell(
                                onTap: (){
                                //  _deleteDialogue(context, index);
                                  noteController.deleteNote(index);
                                },
                                child: Icon(Icons.delete, color: Colors.deepOrange,),
                              ),
                            ],
                          ),
                                    
                        ),
                      ),
                    );
              
                  }
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


  _updateDialogue(BuildContext context, int index){
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
              noteController.updateNote(NoteModel(idCrt.text, nameCrt.text, dptCrt.text), index);
              Navigator.pop(context);

            }, child:Text('Update', style: TextStyle(
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
