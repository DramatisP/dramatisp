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
          child: CharacterList2(getCharacters()),
        ), 
      ),
    );
  }

}

class CharacterList2 extends StatelessWidget {
  List characters;
  CharacterList2(this.characters);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(BuildContext context) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, int) {
        return Container(
          height: 100,
          child: Center(
            child: Column(
              children: [
                Text(characters[int][0]),
                Text(characters[int][1]),
              ],
            ),
          ),
        );
      },
    );
  }
}
