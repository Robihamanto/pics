import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pics/src/blocs/Provider.dart';
import 'package:pics/src/blocs/bloc.dart';
import 'package:pics/src/mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }

}

class LoginScreenState extends State<LoginScreen> with ValidationMixin{

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);

      return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Container(margin: EdgeInsets.only(bottom: 20.0),),
            emailField(bloc),
            Container(margin: EdgeInsets.only(bottom: 20.0),),
            passwordField(bloc),
            Container(margin: EdgeInsets.only(bottom: 20.0),),
            buttonField(),
          ],
        ),
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
      return TextField(
        onChanged: bloc.changeEmail,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: 'Email Address',
            hintText: 'you@example.com',
            errorText: snapshot.error,
        ),
      );
    },
    );
  }

  Widget passwordField(Bloc bloc) {
      return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Password',
              errorText: snapshot.error,
            ),
          );
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