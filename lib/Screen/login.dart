import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:simple_bloc/Screen/home.dart';
import 'package:simple_bloc/Screen/routes/route_generator.dart';


class Login extends StatefulWidget {
 
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();

  void validate(){
    if(formkey.currentState!.validate()){
      Navigator.pushReplacementNamed(context, Home.routeName, arguments: userNameController.text);      
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.all(25.0),
          child: Center(
            child: Form(
              autovalidateMode: AutovalidateMode.always, 
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Username',
                    ),
                    validator: MinLengthValidator(4, errorText:'should be at least 4 character')
                  ),
                   Padding(
                     padding: const EdgeInsets.only(top: 25),
                     child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'password',
                        
                      ),
                      validator:MinLengthValidator(4, errorText: 'should be at least 4 characters'),
                  ),
                   ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: RaisedButton(
                      color: Colors.blueAccent,
                      onPressed: validate,
                      child: const Text('Login',style: TextStyle(
                        color: Colors.white
                      ),),
                      ),
                  )
                ]
              )
          )
        )
              
        
      ),
    );
  }
  
}


 
