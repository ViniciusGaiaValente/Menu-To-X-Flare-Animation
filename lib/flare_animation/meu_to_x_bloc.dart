import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:template/flare_animation/menu_to_x_icon.dart';

enum iconState { x, menu, goX, goMenu }

class MenuToXBloc {

  var icon = MenuToXIcon(animation: "menu");

  final _controller = StreamController<MenuToXIcon>();
  get _sink => _controller.sink;
  get stream => _controller.stream;

  toggleIconState() {
    if (icon.animation != "goX") {
      icon = MenuToXIcon(animation: "goX");
      _sink.add(icon);
    } else if (icon.animation != "goMenu") {
      icon = MenuToXIcon(animation: "goMenu");
      _sink.add(icon);
    }
  }

  changeIconState({ @required iconState state}) {
    switch (state) {
      case iconState.x:
        _sink.add(MenuToXIcon(animation: "x",));
        break;
      case iconState.menu:
        _sink.add(MenuToXIcon(animation: "menu",));
        break;
      case iconState.goMenu:
        _sink.add(MenuToXIcon(animation: "goX",));
        break;
      case iconState.goX:
        _sink.add(MenuToXIcon(animation: "goMenu",));
        break;
    }
  }
}