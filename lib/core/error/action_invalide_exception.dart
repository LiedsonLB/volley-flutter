class ActionInvalideException implements Exception {
  final String message;

  ActionInvalideException(this.message);

  @override
  String toString() {
    return 'Ação inválida: $message';
  }
}
