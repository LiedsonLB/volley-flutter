import 'package:flutter/material.dart';

import 'package:volleyapp/core/constants/colors.dart';
import 'package:volleyapp/features/home/data/repositories/team_repository_impl.dart';
import 'package:volleyapp/features/home/domain/entities/team.dart';
import 'package:volleyapp/features/home/domain/usecases/get_teams.dart';
import 'package:volleyapp/features/home/presentation/widgets/team_card.dart';

class ContainerTeams extends StatelessWidget {
  final GetTeams getTeams = GetTeams(TeamRepositoryImpl());

  ContainerTeams({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.center,
          child: RotatedBox(
            quarterTurns: 3,
            child: Container(
              margin: const EdgeInsets.only(top: 10.0),
              alignment: Alignment.center,
              width: 40.0 * 5,
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              decoration: BoxDecoration(
                color: AppColors.blue,
                border: Border.all(
                  color: AppColors.white,
                  width: 2.0,
                ),
              ),
              child: const Text(
                'TIMES',
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'ConcertOne',
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                FutureBuilder<List<Team>>(
                  future: getTeams.call(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return const Text('Erro ao carregar times.');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text('Nenhum time disponível.');
                    } else {
                      final teams = snapshot.data!;
                      return Column(
                        children: teams
                            .map((team) => TeamCard(
                                  team: team,
                                ))
                            .toList(),
                      );
                    }
                  },
                )
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
