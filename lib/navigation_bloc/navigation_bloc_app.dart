import 'package:flutter/material.dart';
import 'package:template/navigation_bloc/navigation_bloc.dart';
import 'pages.dart';

class NavigationBlocApp extends StatelessWidget {

  final navigator = NavigationBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            FlatButton(
              child: Text("go to main page"),
              onPressed: () => navigator.goTo(page.main),
            ),
            FlatButton(
              child: Text("go to page one"),
              onPressed: () => navigator.goTo(page.one),
            ),
            FlatButton(
              child: Text("go to page two"),
              onPressed: () => navigator.goTo(page.two),
            ),
          ],
        ),
        body: StreamBuilder(
          stream: navigator.stream,
          initialData: Main(),
          builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
            return snapshot.data;
          },
        ),
      ),
    );
  }
}