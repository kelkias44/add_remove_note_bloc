import 'package:flutter/material.dart';
import 'package:simple_bloc/Screen/note_adding.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc/bloc/bloc/notebloc_bloc.dart';
import 'package:simple_bloc/constants/enums.dart';
import 'package:simple_bloc/models/note_model.dart';

class Home extends StatefulWidget {
  static const routeName = '/Home';
  String userName;
  Home({Key? key, required this.userName}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.userName)),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            BlocBuilder<NoteBloc, NoteState>(
              builder: (context, state) {
                if (state is NoteInitial) {
                  return Text('no note saved');
                } else if (state is NoteLoaded) {
                  return ListView.builder(
                      itemCount: state.notes.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext ctx, index) => NoteCard(
                            notes: state.notes[index],
                          ));
                } else {
                  return Text('something want error');
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, AddNote.routeName,
                    arguments: widget.userName);
              },
              child: Icon(Icons.add),
            )
          ],
        )),
      ),
    );
  }
}

class NoteCard extends StatelessWidget {
  final Note notes;
  const NoteCard({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
  Text StatusDisplay(NoteStatus stat){
  String a;
  if(stat == NoteStatus.Done){
    a = 'Done';
  }else {a = 'Active';}

  return Text(a,style: TextStyle(
    color: Colors.grey,
  ),);
  
}
    return Dismissible(
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red,
        child: const Icon(
          Icons.delete_forever,
          color: Colors.white,
        ),
      ),
      key: ObjectKey(notes),
      onDismissed: (direction) {
        BlocProvider.of<NoteBloc>(context)
          ..add(RemoveNote(Note(
              body: notes.body,
              title: notes.title,
              noteStatus: notes.noteStatus)));
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('note deleted')));
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3),
              )
            ],
          ),
          child: Column(
            children: <Widget>[
              Container(               
                alignment: Alignment.topRight,
                child: StatusDisplay(notes.noteStatus),
                  
                ),              
              Text(notes.title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
              SizedBox(
                height: 20,
              ),
              Text(notes.body,style: TextStyle(color: Colors.grey,fontSize: 18),)
            ],
          ),
        ),
      ),
    );
  }
}


