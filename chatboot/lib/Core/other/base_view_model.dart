import 'package:chatboot/Core/enums/enums.dart';
import 'package:flutter/material.dart';

class BaseViewModel  extends ChangeNotifier{
  ViewState _state = ViewState.idle;

  ViewState get state  =>_state;

  setstate(ViewState state){
    _state = state;
    notifyListeners();
  }
}