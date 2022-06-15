import 'package:flutter/material.dart';

import 'character_model.dart';
import 'character_list.dart';

class CharacterScreen extends StatelessWidget {
  List getCharacters() {
    return [
      Character("Daske", "Magierturm", "Magier"),
      Character("Namdosch", "Erdhöhle", "Geode"),
      Character("Olainen", "Wolfsrudel", "Nivese"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Characters")
      ),
      body: Container(
        child: Center(
          child: CharacterList(getCharacters()),
        ), 
      ),
    );
  }

}
