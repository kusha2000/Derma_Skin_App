import 'package:flutter/material.dart';
import 'package:derma_skin_app/Pages/Risk_Profile/risk_question.dart';
import 'package:derma_skin_app/Pages/Risk_Profile/risk_answer_model.dart';
import 'package:derma_skin_app/Pages/Risk_Profile/risk_question_page.dart';

class StartRiskProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Question> questions = [
      Question(
          questionText: 'Do you have more than 50 moles?',
          options: ['No', 'Yes']),
      Question(
          questionText:
              'Do you have over 3 suspicious moles, which look different than your other moles?',
          options: ['No', 'Yes']),
      Question(
          questionText:
              'Do you have a pale skin which burns easily (potentially combined with red or light hair and freckles)?',
          options: ['No', 'Yes']),
      Question(
          questionText:
              'Did you experience severe sunburns (with blisters) at least twice during your childhood?',
          options: ['No', 'Yes']),
      Question(
          questionText:
              'On average, do you go outside for more than 2 hours a day without protecting your skin from sunlight(sunscreen or covering clothing)?',
          options: ['No', 'Yes']),
      Question(
          questionText:
              'Have you ever been treated for one or multiple malignant moles(melanoma) or another form of skin cancer?',
          options: ['No', 'Yes']),
      Question(
          questionText:
              'Has any of your close family ever experienced malignant or suspicious moles( only parents or children)?',
          options: ['No', 'Yes']),
      Question(
          questionText:
              'Does any of your close family suffer from pancreatic cancer (only parent or children)?',
          options: ['No', 'Yes']),
    ];

    return Scaffold(
      body: QuestionPage(
        questionIndex: 0,
        answerModel: AnswerRiskModel(questions.length),
        questions: questions,
      ),
    );
  }
}
