import 'package:flutter/material.dart';
import 'package:volleyapp/features/home/presentation/pages/modals/modal_add_teams.dart';

import 'package:volleyapp/features/home/presentation/pages/modals/modal_select_teams.dart';

class TeamController {
  void showAddTeamModal(
    BuildContext context,
    Function(String, int) onAddTeam,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Material(
          child: ModalAddTeams(
            onAddTeam: onAddTeam,
          ),
        );
      },
    );
  }

  void showSelectTeamsModal(
    BuildContext context,
    Function(String, String) onTeamsSelected,
    VoidCallback startGame,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ModalSelectTeams(
          onTeamsSelected: onTeamsSelected,
          startGame: startGame,
        );
      },
    );
  }
}
