import 'package:flutter/cupertino.dart';

class AddTodosProvider extends ChangeNotifier {
  TextEditingController _title = TextEditingController();
  TextEditingController get getTitle => _title;
  set setTitle(val) {
    TextSelection prevSelection = _title.selection;
    _title.text = val;
    _title.selection = prevSelection;
    notifyListeners();
  }

  TextEditingController _trailing = TextEditingController();
  TextEditingController get getTrailing => _trailing;
  set settrailing(val) {
    TextSelection prevSelection = _trailing.selection;
    _trailing = val;
    _trailing.selection = prevSelection;

    notifyListeners();
  }
}
