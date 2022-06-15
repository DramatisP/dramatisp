import 'package:flutter/material.dart';

import 'character_model.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  CharacterCard(this.character);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(character.name),
              Text(character.location),
              Text(character.archetype),
            ],
          ),
          Column(
            children: [
              Text(character.name),
              Text(character.location),
              Text(character.archetype),
            ],
          ),
        ],

      ),
    );
  }
}
