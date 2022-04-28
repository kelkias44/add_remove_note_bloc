import 'package:flutter/material.dart';
import 'package:simple_bloc/Screen/home.dart';
import 'package:simple_bloc/bloc/bloc/notebloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc/models/note_model.dart';
import 'package:simple_bloc/constants/enums.dart';

class AddNote extends StatefulWidget {
  String userName;
  static const routeName = '/AddNote';

  AddNote({Key? key, required this.userName}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  NoteStatus status = NoteStatus.Active;

  int _value =1;

  TextEditingController titleController = TextEditingController();

  TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userName),
      ),
      body: BlocProvider<NoteBloc>(
        create: (context) => NoteBloc(),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 218, 218, 218),
                        ),
                      ),
                      labelText: 'Title',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: TextFormField(
                      controller: bodyController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        fillColor: Colors.black,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 218, 218, 218),
                          ),
                        ),
                        labelText: 'Body',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Radio(value: 1, 
                            groupValue: _value,
                            onChanged: (value){
                              setState((){
                              _value = value as int;
                              });                                                        
                            }),
                            Text('Active')
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Radio(value: 2, 
                            groupValue: _value,
                            onChanged: (value){
                               setState((){
                              _value = value as int;
                              });                              
                            }),
                            Text('Done')
                          ],
                        )
                      ],
                    ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: RaisedButton(
                      color: Colors.blueAccent,
                      onPressed: () {
                        // BlocProvider.of<NoteBloc>(context).add(LoadedNote());
                        BlocProvider.of<NoteBloc>(context).add(AddNotes(Note(body: bodyController.text, title: titleController.text,noteStatus: NoteStat(_value) )));
                        Navigator.pushReplacementNamed(context, Home.routeName, arguments: widget.userName);
                      },
                      child: const Text('Save',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


NoteStatus NoteStat(int v){
  if(v==1)return NoteStatus.Active;
  else return NoteStatus.Done;
}
