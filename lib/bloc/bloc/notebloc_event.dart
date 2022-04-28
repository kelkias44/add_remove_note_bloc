part of 'notebloc_bloc.dart';

@immutable
abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override 
  List<Object?> get Props => [];
}
class LoadedNote extends NoteEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AddNotes extends NoteEvent{
  final Note note;
  // final String body;

  AddNotes(this.note);

  @override
  // TODO: implement props
  List<Object?> get props => [note];
}


class RemoveNote extends NoteEvent{
  final Note note;
  // final String body;

  RemoveNote(this.note);
  
   
  @override
  // TODO: implement props
  List<Object?> get props => [note];
}

class StatusActive extends NoteEvent{
  final NoteStatus stat;

  StatusActive({required this.stat});

  @override
  // TODO: implement props
  List<Object?> get props => [stat];
}
class StatusDone extends NoteEvent{
  final NoteStatus stat;

  StatusDone({required this.stat});

  @override
  // TODO: implement props
  List<Object?> get props => [stat];
}
