import 'package:flutter/material.dart';

class CharacterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Characters")
      ),
      body: Center(
        child: Text("Character List")
      )
    )
  }

}
