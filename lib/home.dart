import 'package:flutter/material.dart';

class HomeLanguagesWidget extends StatefulWidget {
  const HomeLanguagesWidget({super.key});

  @override
  State<HomeLanguagesWidget> createState() => _HomeLanguagesWidgetState();
}

class _HomeLanguagesWidgetState extends State<HomeLanguagesWidget> {

  final List _selecteds = [false, false, false, false];

  _setSelected(index, value){
    setState(() {
      _selecteds[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minhas linguagens"),
        backgroundColor: Colors.blue,
      ),
      body: Column(children: [
        Center(
          child: Wrap(
            spacing: 10,
            children: [
              ChoiceChip(label: const Text("Android Nativo"), selected: _selecteds[0], onSelected: (value) => _setSelected(0, value)),
              ChoiceChip(label: const Text("iOs Nativo"), selected: _selecteds[1], onSelected: (value) => _setSelected(1, value)),
              ChoiceChip(label: const Text("Flutter"), selected: _selecteds[2], onSelected: (value) => _setSelected(2, value)),
              ChoiceChip(label: const Text("React Native"), selected: _selecteds[3], onSelected: (value) => _setSelected(3, value)),
            ],
          ),
        ),
        Expanded(
          child: 
          ListView(children: _buildItems()))
      ]),
    );
  }

  List<Widget> _buildItems(){
    List<Widget> result = [];

    if(_selecteds[0]){
      result.add(const Card(child: ListTile(
              leading: Text("1"),
              title: Text("Android Nativo"),
              subtitle: Text("Linguagens C, Java e Kotlin"),
            )));
    }

    if(_selecteds[1]){
      result.add(const Card(child: ListTile(
              leading: Text("2"),
              title: Text("iOs Nativo"),
              subtitle: Text("Linguagens Objective-C, Swift"),
            )));
    }

    if(_selecteds[2]){
      result.add(const Card(child: ListTile(
              leading: Text("3"),
              title: Text("Flutter"),
              subtitle: Text("Linguagem Dart"),
            )));
    }

    if(_selecteds[3]){
      result.add(const Card(child: ListTile(
              leading: Text("4"),
              title: Text("React Native"),
              subtitle: Text("Linguagem Javascript e Typescript"),
            )));
    }

    return result;
  }
}
