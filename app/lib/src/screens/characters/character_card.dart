import 'package:app/src/config/color_constants.dart';
import 'package:app/src/screens/characters/character_detail.dart';
import 'package:flutter/material.dart';

import 'character_model.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  CharacterCard(this.character);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: ListTile(
          title: Text(character.name),
          subtitle: Text("${character.archetype}, ${character.location}"),
          leading: Icon(Icons.accessibility, size: 32),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CharacterDetail(character)
              ),
            );
          },
        ),
        color: ColorConstants.secondaryDarkAppColor,
      ),
    );
  }
}
