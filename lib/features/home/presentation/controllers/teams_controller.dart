import 'package:flutter/material.dart';

import 'package:volleyapp/features/home/presentation/widgets/modals/add_team_modal.dart';
import 'package:volleyapp/features/home/presentation/widgets/modals/selection_teams_modal.dart';

class TeamController {
  void showAddTeamModal(
    BuildContext context,
    Function(String, int) onAddTeam,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ModalAddTeams(
          onAddTeam: onAddTeam,
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
