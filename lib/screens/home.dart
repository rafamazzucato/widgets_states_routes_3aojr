import 'package:flutter/material.dart';
import 'package:widgets_states_routes_3aojr/models/language.dart';

class HomeLanguagesWidget extends StatefulWidget {
  const HomeLanguagesWidget({super.key});

  @override
  State<HomeLanguagesWidget> createState() => _HomeLanguagesWidgetState();
}

class _HomeLanguagesWidgetState extends State<HomeLanguagesWidget> {

  final List _languages = [];

  _setSelected(Language language){
    setState(() {
      language.selected = !language.selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minhas linguagens"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(icon: const Icon(Icons.add),
          onPressed: (){
            final future = Navigator.pushNamed(context, "/add");

            future.then((language){
              setState(() {
                _languages.add(language);
              });
            });
          })
        ],
      ),
      body: Column(children: [
        Center(
          child: Wrap(
            spacing: 10,
            children: _buildChoices(),
          ),
        ),
        Expanded(
          child: 
          ListView(children: _buildItems()))
      ]),
    );
  }

  List<Widget> _buildChoices(){
    return _languages.map((language) => ChoiceChip(
        label: Text(language.title), 
        selected: language.selected, 
        onSelected: (value) => _setSelected(language))).toList();
  }

  List<Widget> _buildItems(){
    return _languages
      .where((language) => language.selected)
      .map((language) => Card(child: ListTile(
              leading: Text(language.id.toString()),
              title: Text(language.title),
              subtitle: Text(language.subtitle),
            ))).toList();
  }
}
