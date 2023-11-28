import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/models/random_user_state.dart';

class BookmarkProvider extends ChangeNotifier {
  List<Result> savedPerson = [];

  void savedBookmark(Result value) {
    savedPerson.add(value);
  }

  void removeBookmark(Result value) {
    savedPerson.remove(value);
  }
}
