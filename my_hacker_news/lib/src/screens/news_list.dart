import 'package:flutter/material.dart';
import 'dart:async';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Top News"),
      ),
      body: buildList(),
    );
  }

  Widget buildList() {
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (context, int index) {
        return FutureBuilder(
          future: getFuture(),
          builder: (context, snapshot) {
            return new Container(
              height: 80.0,
              child: snapshot.hasData
                  ? Text("I'm visible $index")
                  : Text("Data hasen't fetched yet at $index"),
            );
          },
        );
      },
    );
  }

  getFuture() {
    return Future.delayed(Duration(seconds: 2), () => "Hi");
  }
}
