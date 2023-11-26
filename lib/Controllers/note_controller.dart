
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../Models/note_model.dart';

class NoteController extends GetxController{
  final Box box=Hive.box("notes");

  void createNote(NoteModel note) {
    box.add(note);
  }


void updateNote(NoteModel note, int index){
  box.putAt(index, note) ;

}

void deleteNote(int index){
   box.deleteAt(index);

}
}
