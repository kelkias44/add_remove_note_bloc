import 'package:flutter/material.dart';
import 'package:simple_bloc/bloc/bloc/notebloc_bloc.dart';
import 'Screen/login.dart';
import 'Screen/routes/route_generator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final RouteGenerator _routeGenerator = RouteGenerator();
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteBloc(),
      child: MaterialApp(
        title: 'Bloc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: Login(),
        initialRoute: '/',
        onGenerateRoute: _routeGenerator.generateRoute,
      ),
    );
  }
}
