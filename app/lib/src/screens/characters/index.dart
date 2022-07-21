import 'package:flutter/material.dart';

import 'character_model.dart';
import 'character_list.dart';
import 'character_card.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          child: Center(
            child: CharacterList(getCharacters()),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
        },
      ),
    );
  }

}

class CharacterList2 extends StatelessWidget {
  final List characters;
  CharacterList2(this.characters);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(BuildContext context) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, int) {
        return CharacterCard(characters[int]);
      },
    );
  }
}
