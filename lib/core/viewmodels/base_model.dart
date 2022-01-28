import 'package:clean_architecture/core/enums/viewstate.dart';
import 'package:flutter/widgets.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  void setState(ViewState viewState, {bool triggerListener = true}) {
    _state = viewState;
    if (triggerListener) notifyListeners();
  }
}
