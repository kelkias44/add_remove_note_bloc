import 'package:flutter/material.dart';
import 'package:simple_bloc/Screen/home.dart';
import 'package:simple_bloc/Screen/login.dart';
import 'package:simple_bloc/Screen/note_adding.dart';
import 'package:simple_bloc/bloc/bloc/notebloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RouteGenerator{
  final NoteBloc _noteBlocs = NoteBloc();
   Route<dynamic> generateRoute(RouteSettings settings){

    final args = settings.arguments;
    switch (settings.name) {
      case '/':
      return MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _noteBlocs,
          child: Login(),
        ));
        break;
      case Home.routeName:
      return MaterialPageRoute(
        builder:(_) => BlocProvider.value(
        value: _noteBlocs,
        child: Home(
              userName: args as String,        
            ),
      ));
      break;
      case AddNote.routeName:
      return MaterialPageRoute(
        builder:(_) => BlocProvider.value(
        value: _noteBlocs,
        child: AddNote(
              userName: args as String,        
            ),
      ));
      
      default:
      return MaterialPageRoute(builder: (_)=>Login());
    }
  }
}