import 'dart:async';
import 'package:pics/src/blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Validators{

  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  // Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get isValid => Rx.combineLatest2(email, password, (e, p) => true);

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;

    print(validEmail);
    print(validPassword);
  }

  dispose() {
    _email.close();
    _password.close();
  }

}

final bloc = Bloc();