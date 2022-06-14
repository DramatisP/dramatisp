import 'package:flutter/material';

import 'character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  CharacterCard(this.character);

  @override
  Widget build(BuildContext context) {
    return Text("Hello CharacterCard");
  }
}
