class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;
  List<String> getSuffledAnswer() {
    final sufflledList = List.of(answers);
    sufflledList.shuffle();
    return sufflledList;
  }
}
