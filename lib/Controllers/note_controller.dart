
import 'package:get/get.dart';

import '../Models/note_screen.dart';

class NoteController extends GetxController{
List<NoteModel> notes =[];
void createNote(NoteModel note) {
  // Check for null or empty values before adding the note
  if (note.id.isNotEmpty && note.name.isNotEmpty && note.department.isNotEmpty) {
    notes.add(note);
  } else {
    // Handle the case where any of the fields is empty
    // You can show a message or take appropriate action
  }
} 

}
