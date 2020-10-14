import 'dart:async';
import 'package:pics/src/blocs/validators.dart';

class Bloc extends Validators{

  final _email = StreamController<String>();
  final _password = StreamController<String>();

  // Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  // Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  void dispose() {
    _email.close();
    _password.close();
  }

}