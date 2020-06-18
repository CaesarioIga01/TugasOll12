import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ColorEvent { to_grey, to_limeAccent }

class ColorBloc extends Bloc<ColorEvent, Color>{
  Color _color = Colors.grey;

  @override
  Color get initialState => Colors.grey;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    _color = (event == ColorEvent.to_grey) ? Colors.grey : Colors.limeAccent;
    yield _color;
  }
}