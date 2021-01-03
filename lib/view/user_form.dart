import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Formulário de Usuário'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final isValid = _form.currentState.validate();

                if (isValid) {
                  _form.currentState.save();
                  Navigator.of(context).pop();
                }
              },
            )
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
              key: _form,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nome'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Informe o nome!';
                      }
                      if (value.trim().length < 3) {
                        return 'Nome muito pequeno. No mínimo 3 letras!';
                      }

                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'E-mail'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Url do avatar'),
                  ),
                ],
              ),
            )));
  }
}
