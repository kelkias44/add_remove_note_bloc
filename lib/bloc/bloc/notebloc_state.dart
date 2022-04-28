part of 'notebloc_bloc.dart';


@immutable
abstract class NoteState extends Equatable{
  const NoteState();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class NoteInitial extends NoteState {}

class NoteLoadingError extends NoteState {}
class NoteLoading extends NoteState {}

class NoteLoaded extends NoteState{
  final List<Note> notes;
  // final List<String> body; 
  
  // final List<Note> notes;

  // NoteLoaded({required this.notes});
  NoteLoaded({required this.notes});

  @override
  // TODO: implement props
  List<Object?> get props => [notes];



}
