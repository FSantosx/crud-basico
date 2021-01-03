import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'package:flutter_crud/models/user.dart';

// metodo com observer
class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  // metodo get
  List<User> get all {
    // ...operador spread que faz um clone do original
    // preferivel retornar a cópia do que a referencia, pois ira ter
    //ter impacto nesta classe
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  // metodo put insere um elemento que não existe, se houver, ele altera
  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      //alterar
      _items.update(user.id, (_) => user);
    } else {
      // adicionar
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => User(
                id: id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    }
    notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
