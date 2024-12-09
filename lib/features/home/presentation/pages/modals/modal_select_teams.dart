import 'package:flutter/material.dart';

import 'package:volleyapp/components/button_layout.dart';
import 'package:volleyapp/features/home/data/repositories/team_repository_impl.dart';
import 'package:volleyapp/features/home/domain/entities/team.dart';
import 'package:volleyapp/features/home/domain/usecases/get_teams.dart';
import 'package:volleyapp/features/home/presentation/controllers/teams_controller.dart';

class ModalSelectTeams extends StatefulWidget {
  final Function(String, String) onTeamsSelected;
  final VoidCallback startGame;

  const ModalSelectTeams(
      {super.key, required this.onTeamsSelected, required this.startGame});

  @override
  _ModalSelectTeamsState createState() => _ModalSelectTeamsState();
}

class _ModalSelectTeamsState extends State<ModalSelectTeams> {
  String? selectedTeam1;
  String? selectedTeam2;

  GetTeams getTeams = GetTeams(TeamRepositoryImpl());
  final teamController = TeamController();

  void _confirmSelection() {
    if (selectedTeam1 != null &&
        selectedTeam2 != null &&
        selectedTeam1 != selectedTeam2) {
      widget.onTeamsSelected(selectedTeam1!, selectedTeam2!);
      Navigator.of(context).pop();
      teamController.startGame(context, selectedTeam1!, selectedTeam2!);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Selecione dois times diferentes.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
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
                FutureBuilder<List<Team>>(
                  future: getTeams.call(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return const Text('Erro ao carregar times.');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text('Nenhum time disponível.');
                    }

                    final teams = snapshot.data!;
                    return DropdownButton<String>(
                      value: selectedTeam1,
                      hint: const Text('Selecione o time 1'),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedTeam1 = newValue;
                        });
                      },
                      items: teams.map<DropdownMenuItem<String>>((team) {
                        return DropdownMenuItem<String>(
                          value: team.name,
                          child: Text(team.name),
                        );
                      }).toList(),
                    );
                  },
                ),
                const SizedBox(height: 20.0),
                FutureBuilder<List<Team>>(
                  future: getTeams.call(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return const Text('Erro ao carregar times.');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text('Nenhum time disponível.');
                    }

                    final teams = snapshot.data!;
                    return DropdownButton<String>(
                      value: selectedTeam2,
                      hint: const Text('Selecione o time 2'),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedTeam2 = newValue;
                        });
                      },
                      items: teams.map<DropdownMenuItem<String>>((team) {
                        return DropdownMenuItem<String>(
                          value: team.name,
                          child: Text(team.name),
                        );
                      }).toList(),
                    );
                  },
                ),
                const SizedBox(height: 30.0),
                ButtonLayout(
                  onPressed: _confirmSelection,
                  text: 'Iniciar Jogo',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
