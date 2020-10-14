import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pics/src/mixins/validation_mixin.dart';

class LoginScene extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return LoginSceneState();
  }

}

class LoginSceneState extends State<LoginScene> with ValidationMixin{

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Do Login'),
          ),
          body: Container(
            margin: EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(margin: EdgeInsets.only(bottom: 20.0),),
                  emailField(),
                  Container(margin: EdgeInsets.only(bottom: 20.0),),
                  passwordField(),
                  Container(margin: EdgeInsets.only(bottom: 20.0),),
                  buttonField(),
                ],
              ),
            ),
          )
        ),
      );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com'
      ),
      validator: validateEmail,
      onSaved: (newValue) {
        print(newValue);
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Password',
      ),
      // ignore: missing_return
      validator: validatePassword,
      onSaved: (newValue) {
        print(newValue);
      },
    );
  }

  Widget buttonField() {
    return RaisedButton(
      child: Text('Submit'),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
        }
    });
  }

}