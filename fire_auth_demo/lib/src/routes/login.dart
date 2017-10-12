import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_flux/flutter_flux.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../utils.dart';

class Login extends StatelessWidget {
  Login({
    @required this.auth,
  });

  static final GlobalKey<ScaffoldState> _loginScaffoldKey =
      new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _emailKey =
      new GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _passwordKey =
      new GlobalKey<FormFieldState<String>>();

  final FirebaseAuth auth;

  _validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is required.';
    }
    return null;
  }

  _validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required.';
    }
    return null;
  }

  _handleSubmitted(FirebaseAuth store) async {
    print('TESTING: begin submit');
    final FormState form = _formKey.currentState;
    final FormFieldState<String> email = _emailKey.currentState;
    final FormFieldState<String> password = _passwordKey.currentState;
    if (!form.validate()) {
      print('TESTING: bad validate');
      // setAutovalidateAction(true);
    } else {
      form.save();
      print('TESTING: good validate');
      print('TESTING: getting user');
      FirebaseUser user = await auth.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );
      print('TESTING: got user');
      print('user: $user');
      setUserAction(user);
      setCurrentViewAction(ViewState.main);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _loginScaffoldKey,
      appBar: new AppBar(
        title: new Text('Login Route Widget'),
      ),
      body: new Form(
        key: _formKey,
        autovalidate: false,
        child: new ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: <Widget>[
            new TextFormField(
              key: _emailKey,
              decoration: const InputDecoration(
                icon: const Icon(Icons.email),
                hintText: 'user@email.com',
                labelText: 'Email *',
              ),
              onSaved: (String value) {
                setAuthEmailAction(value);
              },
              validator: _validateEmail,
            ),
            new TextFormField(
              key: _passwordKey,
              decoration: const InputDecoration(
                hintText: 'password',
                labelText: 'Password *',
              ),
              obscureText: true,
              onSaved: (String value) {
                setAuthPasswordAction(value);
              },
              validator: _validatePassword,
            ),
            new Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: new RaisedButton(
                child: new Text('LOGIN'),
                onPressed: () {
                  _handleSubmitted(auth);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
