import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'Form Example',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new FormApp()
    )
  );
}

class FormApp extends StatefulWidget {
  FormApp({Key key}) : super(key: key);

  @override
  _FormAppState createState() => new _FormAppState();
}

class _FormAppState extends State<FormApp> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Widget dismissButton = new RaisedButton(
      child: new Text('dismiss'),
      onPressed: () {
        Focus.clear(context);
      }
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Form Example')
      ),
      body: new Center(
        child: new Container(
          child: new Form(
            key: _formKey,
            child: new Block(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: <Widget>[
                new InputFormField(
                  keyboardType: TextInputType.text,
                  icon: new Icon(Icons.assignment_ind),
                  labelText: 'firstname',
                  hintText: 'Enter your first name',
                  // style: new TextStyle(),
                  // hideText: false, // default: false
                  // isDense: false, // default: false
                  // autofocus: false, // default: false
                  // maxLines: 1, // default: 1
                  // initialValue: InputValue.empty, // default: InputValue.empty
                  onSaved: (InputValue value) {
                    print('called when form is saved');
                  },
                  validator: (InputValue value) {
                    print('called whenever the value changes');
                  }
                ),
                new SizedBox(
                  width: 20.0,
                  child: dismissButton
                )
              ]
            )
          )
        ),
      )
    );
  }
}
