class TeamData {
  final String name;
  final int players;

  TeamData({required this.name, required this.players});

  @override
  String toString() {
    return 'TeamData(name: $name, players: $players)';
  }
}