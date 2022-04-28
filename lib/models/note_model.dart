import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_bloc/constants/enums.dart';

class Note extends Equatable{
  String title; String body; NoteStatus noteStatus;

  Note({
    required this.body, required this.title,required this.noteStatus
  });

  // static List<Note> notes = [];
  @override
  // TODO: implement props
  List<Object?> get props => [title,body];
  
}