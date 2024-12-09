import 'package:flutter/material.dart';

import 'package:volleyapp/core/constants/colors.dart';
import 'package:volleyapp/features/home/data/repositories/team_repository_impl.dart';
import 'package:volleyapp/features/home/domain/usecases/add_team.dart';
import 'package:volleyapp/features/home/domain/usecases/get_teams.dart';
import 'package:volleyapp/features/home/presentation/widgets/modals/alert_modal.dart';

class ModalAddTeams extends StatefulWidget {
  final Function(String, int) onAddTeam;

  const ModalAddTeams({super.key, required this.onAddTeam});

  @override
  _ModalAddTeamsState createState() => _ModalAddTeamsState();
}

class _ModalAddTeamsState extends State<ModalAddTeams> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _playersController = TextEditingController();

  AddTeam addTeam = AddTeam(TeamRepositoryImpl());
  GetTeams getTeams = GetTeams(TeamRepositoryImpl());

  void _addTeam() {
    final String name = _nameController.text;
    final int? players = int.tryParse(_playersController.text);

    if (name.isNotEmpty && players != null) {
      addTeam(name, players);

      Navigator.pop(context);
    } else {
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const AlertModal(
            title: 'Campos não preenchidos',
            content: 'Por favor preencha todas os campos corretamente.',
            buttonText: 'Entendi',
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Adicionar time',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 6, 40, 104),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      side:
                          const BorderSide(width: 0, color: Colors.transparent),
                    ),
                    backgroundColor: Colors.grey[50],
                    padding: const EdgeInsets.all(10),
                  ),
                  child: const Icon(Icons.close, color: AppColors.darkBlue),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nome do time',
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: _playersController,
                    decoration: const InputDecoration(
                      labelText: 'Número de jogadores',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 40.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      backgroundColor: const Color.fromARGB(255, 6, 40, 104),
                      foregroundColor: AppColors.white,
                      padding: const EdgeInsets.all(20),
                    ),
                    onPressed: _addTeam,
                    child: const Center(
                      child: Text(
                        'Adicionar',
                        style: TextStyle(
                          fontFamily: 'ConcertOne',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
