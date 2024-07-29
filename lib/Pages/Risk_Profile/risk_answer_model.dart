class AnswerRiskModel {
  List<String> answers;

  AnswerRiskModel(int numberOfQuestions)
      : answers = List.filled(numberOfQuestions, '');

  void setAnswer(int index, String answer) {
    answers[index] = answer;
  }
}
