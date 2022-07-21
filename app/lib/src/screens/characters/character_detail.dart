import 'package:app/src/screens/characters/character_model.dart';
import 'package:flutter/material.dart';

class CharacterDetail extends StatelessWidget {
  final Character character;

  CharacterDetail(this.character);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${character.name}")
      ),
      body: Center(
        child: CharacterForm(character),
      )
    );
  }
  
}

class CharacterForm extends StatefulWidget {
  final Character character;

  CharacterForm(this.character);

  @override
  _CharacterFormState createState() => _CharacterFormState();
}

class _CharacterFormState extends State<CharacterForm> {
  final _formKey = GlobalKey<FormState>();
  var nameController;
  var archetypeController;
  var locationController;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.character.name);
    archetypeController = TextEditingController(text: widget.character.archetype);
    locationController = TextEditingController(text: widget.character.location);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
                labelText: 'Name'
            ),
          ),
          TextFormField(
            controller: archetypeController,
            decoration: InputDecoration(
                labelText: 'Archetype'
            ),
          ),
          TextFormField(
            controller: locationController,
            decoration: InputDecoration(
                labelText: 'Location'
            ),
          ),
        ],
      )
    );
  }
}