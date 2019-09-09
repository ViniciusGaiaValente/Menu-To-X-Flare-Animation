import 'dart:async';
import 'package:flutter/material.dart';
import 'pages.dart';

enum page { main, one, two }

class NavigationBloc {

  final _controller = StreamController<Widget>();
  StreamSink<Widget> get _sink => _controller.sink;
  Stream<Widget> get stream => _controller.stream;

  final _pageController = StreamController<page>();

  NavigationBloc() {
    _pageController.stream.listen(goTo);
  }

  void goTo([page _page]) {
    switch (_page) {
      case page.main:
        _sink.add(Main());
        break;
      case page.one:
        _sink.add(One());
        break;
      case page.two:
        _sink.add(Two());
        break;
    }
  }
}