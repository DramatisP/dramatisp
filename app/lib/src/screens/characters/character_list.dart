import 'package:flutter/material.dart';

import 'character_card.dart';
import 'character_model.dart';

class CharacterList extends StatelessWidget {
  final List characters;
  CharacterList(this.characters);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(BuildContext context) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, int) {
        return CharacterCard(characters[int]);
      }
    );
  }
}
