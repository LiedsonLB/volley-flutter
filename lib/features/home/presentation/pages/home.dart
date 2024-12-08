import 'package:flutter/material.dart';

import 'package:volleyapp/components/button_layout.dart';

import 'package:volleyapp/core/constants/colors.dart';
import 'package:volleyapp/features/home/data/repositories/team_repository_impl.dart';
import 'package:volleyapp/features/home/domain/usecases/add_team.dart';
import 'package:volleyapp/features/home/presentation/controllers/teams_controller.dart';
import 'package:volleyapp/features/home/presentation/widgets/button_add_teams.dart';
import 'package:volleyapp/features/home/presentation/widgets/container_teams.dart';
import 'package:volleyapp/features/home/presentation/widgets/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String team1;
  late String team2;

  final AddTeam addTeam = AddTeam(TeamRepositoryImpl());

  final _teamController = TeamController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Header(),
            const SizedBox(height: 50.0),
            ContainerTeams(),
            const SizedBox(height: 70.0),
            Column(
              children: [
                Text(
                  'Jogo Casado',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey[50],
                    fontFamily: 'ConcertOne',
                  ),
                ),
                ButtonLayout(
                  onPressed: () {
                    _teamController.showSelectTeamsModal(
                      context,
                      (selectedTeam1, selectedTeam2) {
                        setState(
                          () {
                            team1 = selectedTeam1;
                            team2 = selectedTeam2;
                          },
                        );
                      },
                      () {},
                    );
                  },
                  text: 'Selecionar Times',
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: AddTeamButton(
        onPressed: () {
          _teamController.showAddTeamModal(
            context,
            (name, players) {
              setState(() {
                addTeam(name, players);
              });
            },
          );
        },
      ),
    );
  }
}
