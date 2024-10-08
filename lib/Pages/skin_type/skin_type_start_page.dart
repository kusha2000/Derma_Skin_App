import 'package:derma_skin_app/Pages/skin_type/question.dart';
import 'package:derma_skin_app/Pages/skin_type/skin_type_answer.dart';
import 'package:derma_skin_app/Pages/skin_type/skin_type_page.dart';
import 'package:flutter/material.dart';
// import 'package:derma_skin_app/Pages/Risk_Profile/risk_question.dart';
// import 'package:derma_skin_app/Pages/Risk_Profile/risk_answer_model.dart';

class StartSkinType extends StatelessWidget {
  const StartSkinType({super.key});

  @override
  Widget build(BuildContext context) {
    final List<QuestionSkin> questions = [
      QuestionSkin(questionText: 'Your eye color is?', options: [
        'Light blue, light gray or light green',
        'Blue, gray or green',
        'Hazel or light brown',
        'Dark brown',
        'Brownish black'
      ]),
      QuestionSkin(questionText: 'Your natural hair color is?', options: [
        'Red or light bond',
        'Blond',
        'Dark blond or light brown',
        'Dark brown',
        'Black'
      ]),
      QuestionSkin(
          questionText: 'Your natural skin color (before sun exposure)?',
          options: [
            'Ivory white',
            'Fair or pale',
            'Fair to beige, with golden undertone',
            'Olive or light brown',
            'Dark brown or black'
          ]),
      QuestionSkin(
          questionText:
              'How many freckles do you have on unexposed areas of your skin?',
          options: [
            'Many(50+)',
            'A few(15-29)',
            'Very few(1-14)',
            'None',
          ]),
      QuestionSkin(
          questionText: 'How does your skin respond to sun?',
          options: [
            'Always burns, blisters and peels',
            'Often burns, blisters and peels',
            'Burns moderately',
            'Burns rarely, if at all',
            'Never burns',
          ]),
      QuestionSkin(questionText: 'Does your skin tan?', options: [
        'Never, I always burn',
        'Seldom',
        'Sometimes',
        'Often',
        'Always',
      ]),
      QuestionSkin(questionText: 'How deeply do you tan?', options: [
        'Not at all or very little',
        'Lightly',
        'Moderately',
        'Deeply',
        'My skin is naturally dark',
      ]),
      QuestionSkin(
          questionText: 'How sensitive is your face to the sun?',
          options: [
            'Very sensitive',
            'Sensitive',
            'Normal',
            'Resistant',
            'Very resistant, never had a problem',
          ]),
    ];

    return Scaffold(
      body: SkinTypePage(
        questionIndex: 0,
        answerModel: SkinTypeAnswerModel(questions.length),
        questions: questions,
      ),
    );
  }
}
