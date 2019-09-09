import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class MenuToXIcon extends StatelessWidget {

  String animation;

  MenuToXIcon({ @required String animation}) {
    this.animation = animation;
  }

  @override
  Widget build(BuildContext context) {
    return FlareActor(
      "assets/menu_to_x.flr",
      animation: animation,
    );
  }
}
