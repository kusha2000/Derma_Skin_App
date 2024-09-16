import 'package:derma_skin_app/Pages/Risk_Profile/risk_result_page.dart';
import 'package:derma_skin_app/helpers/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:derma_skin_app/Pages/Risk_Profile/risk_question.dart';
import 'package:derma_skin_app/Pages/Risk_Profile/risk_answer_model.dart';

class QuestionPage extends StatefulWidget {
  final int questionIndex;
  final AnswerRiskModel answerModel;
  final List<Question> questions;

  const QuestionPage({
    super.key,
    required this.questionIndex,
    required this.answerModel,
    required this.questions,
  });

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late String? selectedAnswer;

  @override
  void initState() {
    super.initState();
    selectedAnswer = widget.answerModel.answers[widget.questionIndex];
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[widget.questionIndex];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Risk Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF607C6D),
      ),
      body: Container(
        color: const Color(0xFFACBCB1),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    question.questionText,
                    style: const TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                  const SizedBox(height: 30),
                  ...question.options.map((option) {
                    return RadioListTile<String>(
                      title: Text(
                        option,
                        style: const TextStyle(fontSize: 20.0),
                      ),
                      value: option,
                      groupValue: selectedAnswer,
                      onChanged: (value) {
                        setState(() {
                          selectedAnswer = value;
                        });
                        widget.answerModel
                            .setAnswer(widget.questionIndex, value!);
                      },
                    );
                  }).toList(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.questionIndex > 0)
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Previous',
                            style: TextStyle(
                                color: Color(0xFF607C6D),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF607C6D), // Background color
                      ),
                      onPressed: () {
                        if (selectedAnswer == "") {
                          AppHelpers.showSnackBar(
                              context, "Please Select Option");
                        } else {
                          if (widget.questionIndex <
                              widget.questions.length - 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuestionPage(
                                  questionIndex: widget.questionIndex + 1,
                                  answerModel: widget.answerModel,
                                  questions: widget.questions,
                                ),
                              ),
                            );
                          } else {
                            _navigateToResultPage(context);
                          }
                        }
                      },
                      child: Text(
                        widget.questionIndex < widget.questions.length - 1
                            ? 'Next'
                            : 'Done',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to evaluate risk level based on answers and navigate accordingly
  void _navigateToResultPage(BuildContext context) {
    int yesCount =
        widget.answerModel.answers.where((answer) => answer == 'Yes').length;

    if (yesCount >= 6) {
      // Navigate to high risk page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RiskResultPage(
            title: 'High Risk',
            description1:
                'Based on your answers, we’ve found that you may have a higher risk of developing skin cancer in your lifetime.',
            description2:
                'All of us are exposed to UV and sunlight on a daily basis, which acts as the main contributor to 90% of skin cancers.',
            description3:
                'In saying this, we recommend the following tips to keep your skin healthy:',
            description4: '''- Apply SPF30 or higher sunscreen daily.
- When outdoors (between 11-4pm), wear a hat, long sleeves, and sunglasses.
- Avoid sunburns.
- Avoid sun beds (high UV radiation).
- Monitor your skin regularly using Derma. This includes identifying the appearance of new skin spots or changes in shape, color, size, or texture of existing skin spots.''',
          ),
        ),
      );
    } else if (yesCount >= 3) {
      // Navigate to medium risk page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RiskResultPage(
            title: 'Medium Risk',
            description1:
                'Based on your answers, you may have a moderate risk of developing skin cancer in your lifetime.',
            description2:
                'Exposure to UV radiation and sunlight is a key factor in skin cancer risk. However, moderate risk doesn’t mean you shouldn’t take precautions.',
            description3:
                'We recommend the following tips to maintain healthy skin:',
            description4: '''- Use SPF30 or higher sunscreen daily.
- Wear protective clothing, including a hat and sunglasses when outside during peak sunlight hours (11-4pm).
- Avoid sunburns and stay mindful of the time spent in direct sunlight.
- Check your skin for new spots and monitor any changes in existing moles or skin marks.''',
          ),
        ),
      );
    } else {
      // Navigate to low risk page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RiskResultPage(
            title: 'Low Risk',
            description1:
                'Based on your answers, you have a lower risk of developing skin cancer. However, it’s still important to protect your skin from UV exposure.',
            description2:
                'Even with a lower risk, everyone is at some risk of skin damage from the sun. Preventive measures are still vital to maintaining healthy skin.',
            description3: 'Follow these tips to keep your skin in good health:',
            description4:
                '''- Apply sunscreen with SPF30 or higher when outdoors.
- Try to stay in the shade, especially between 11am and 4pm.
- Avoid sunburns and protect yourself during prolonged exposure to the sun.
- Continue monitoring your skin for any changes and consult a dermatologist if needed.''',
          ),
        ),
      );
    }
  }
}
