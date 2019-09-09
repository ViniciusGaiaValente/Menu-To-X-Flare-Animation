import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:template/flare_animation/menu_to_x_icon.dart';
import 'package:template/flare_animation/meu_to_x_bloc.dart';

class MenuToXApp extends StatelessWidget {
  final GlobalKey<InnerDrawerState> _innerDrawerKey = GlobalKey<InnerDrawerState>();
  final menuToX = MenuToXBloc();
  var isDrawerOpen = false;

  _toggle() {
    if (isDrawerOpen) {
      _innerDrawerKey.currentState.close(
        direction: InnerDrawerDirection.start,
      );
      isDrawerOpen = false;
    } else {
      _innerDrawerKey.currentState.open(
        direction: InnerDrawerDirection.start,
      );
      isDrawerOpen = true;
    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: InnerDrawer(
          key: _innerDrawerKey,
          innerDrawerCallback: (a) => menuToX.toggleIconState(),
          tapScaffoldEnabled: true,
          leftChild: NavigationDrawer(),
          scaffold: Scaffold(
            appBar: AppBar(
              title: Text("Flare Animation"),
              leading: FlatButton(
                child: StreamBuilder(
                  stream: menuToX.stream,
                  initialData: MenuToXIcon(animation: "menu"),
                  builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                    return snapshot.data;
                  },
                ),
                onPressed: () {
                  _toggle();
                },
              ),
            ),
            body: Center(
              child: Text("Main Page"),
            ),
          ),
        )
    );
  }
}
class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            "Navigation Drawer",
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}