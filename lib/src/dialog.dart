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
  void alertResult(DialogAction action) {
    print("Tú selección es $action");
  }
  void showAlert() {
    AlertDialog dialog = AlertDialog(
      content: Text("Data"),
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
            ),
            RaisedButton(child: Text("Ver alerta"), onPressed: showAlert)
          ],
        ),
      ),
    );
  }
}
