import 'package:flutter/material.dart';

import 'package:volleyapp/components/button_layout.dart';
import 'package:volleyapp/core/network/api_clients.dart';

class ModalSelectTeams extends StatefulWidget {
  final Function(String, String) onTeamsSelected;
  final VoidCallback startGame;


  const ModalSelectTeams({super.key, required this.onTeamsSelected, required this.startGame});

  @override
  _ModalSelectTeamsState createState() => _ModalSelectTeamsState();
}

class _ModalSelectTeamsState extends State<ModalSelectTeams> {
  String? selectedTeam1;
  String? selectedTeam2;

  void _confirmSelection() {
    if (selectedTeam1 != null &&
        selectedTeam2 != null &&
        selectedTeam1 != selectedTeam2) {
      widget.onTeamsSelected(
          selectedTeam1!, selectedTeam2!);
      Navigator.of(context).pop();
      widget.startGame();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Selecione dois times diferentes.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Escolha os Times'),
              const SizedBox(height: 20.0),
              DropdownButton<String>(
                value: selectedTeam1,
                hint: const Text('Selecione o time 1'),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedTeam1 = newValue;
                  });
                },
                items: ApiClients.getTeams().map<DropdownMenuItem<String>>((team) {
                  return DropdownMenuItem<String>(
                    value: team.name,
                    child: Text(team.name),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20.0),
              DropdownButton<String>(
                value: selectedTeam2,
                hint: const Text('Selecione o time 2'),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedTeam2 = newValue;
                  });
                },
                items: ApiClients.getTeams().map<DropdownMenuItem<String>>((team) {
                  return DropdownMenuItem<String>(
                    value: team.name,
                    child: Text(team.name),
                  );
                }).toList(),
              ),
              const SizedBox(height: 30.0),
              ButtonLayout (
                onPressed: _confirmSelection,
                text: 'Iniciar Jogo',
              ),
            ],
          ),
        ),
      ),
    );
  }
}