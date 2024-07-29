class SkinTypeAnswerModel {
  List<String> answers;

  SkinTypeAnswerModel(int numberOfQuestions)
      : answers = List.filled(numberOfQuestions, '');

  void setAnswer(int index, String answer) {
    answers[index] = answer;
  }
}
