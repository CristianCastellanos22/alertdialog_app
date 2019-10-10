import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget {
  MyDialog({Key key}) : super(key: key);
  _MyDialogState createState() => _MyDialogState();
}

enum DialogAction {
  yes,
  no
}

class _MyDialogState extends State<MyDialog> {
  String inputValue = "";
  void alertResult(DialogAction action) {
    print("Tú selección es $action");
  }
  void showAlert(String value) {
    AlertDialog dialog = AlertDialog(
      content: Text(value),
      actions: <Widget>[
        FlatButton(
            onPressed: () {alertResult(DialogAction.yes);},
            child: Text(
              "Sí",
            )),
        FlatButton(
            onPressed: () {alertResult(DialogAction.no);},
            child: Text(
              "No",
            ))
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }

  void onChanged(String value) {
    setState(() {
      inputValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo alert dialog"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: "Ingrese el texto"),
              onChanged: onChanged,
            ),
            RaisedButton(child: Text("Ver alerta"), onPressed: () {showAlert(inputValue);})
          ],
        ),
      ),
    );
  }
}
