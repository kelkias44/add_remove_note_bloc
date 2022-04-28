import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:simple_bloc/constants/enums.dart';
import 'package:simple_bloc/models/note_model.dart';
part 'notebloc_event.dart';
part 'notebloc_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteLoaded(notes: [])) {
    // on<LoadedNote>((event, emit) {
    //   emit(NoteLoaded(notes: []));
    // });
    on<AddNotes>((event, emit) {
      print(state);
      if(state is NoteLoaded){
        final state = this.state as NoteLoaded;
        emit(NoteLoaded(
          notes: List.from(state.notes)..add(event.note),
         ));}
    });

    on<RemoveNote>((event, emit) {
      if (state is NoteLoaded) {
        final state = this.state as NoteLoaded;
        emit(NoteLoaded(
            notes: List.from(state.notes)..remove(event.note),
            ));
      }
    });
   
  }
}
