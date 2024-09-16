// import 'package:derma_skin_app/Pages/Risk_Profile/risk_question.dart';
import 'package:derma_skin_app/Pages/skin_type/fair_skin_result_page.dart';
import 'package:derma_skin_app/Pages/skin_type/olive_skin_result_page.dart';
import 'package:derma_skin_app/Pages/skin_type/question.dart';
import 'package:derma_skin_app/Pages/skin_type/skin_type_answer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:derma_skin_app/Pages/Risk_Profile/risk_answer_model.dart';
// import 'package:derma_skin_app/Pages/skin_type/fair_skin_page.dart';
// import 'package:derma_skin_app/Pages/skin_type/olive_skin_page.dart';

class SkinTypePage extends StatefulWidget {
  final int questionIndex;
  final SkinTypeAnswerModel answerModel;
  final List<QuestionSkin> questions;

  const SkinTypePage({
    super.key,
    required this.questionIndex,
    required this.answerModel,
    required this.questions,
  });

  @override
  _SkinTypePageState createState() => _SkinTypePageState();
}

class _SkinTypePageState extends State<SkinTypePage> {
  late String? selectedAnswer;

  @override
  void initState() {
    super.initState();
    selectedAnswer = widget.answerModel.answers[widget.questionIndex];
  }

  void evaluateAndNavigate() {
    // Custom logic to evaluate the selected answers
    int score = 0;

    // Example scoring logic based on selected answers
    for (var answer in widget.answerModel.answers) {
      if (answer.contains('Fair') || answer.contains('Light')) {
        score += 1;
      } else if (answer.contains('Olive') || answer.contains('Brown')) {
        score += 2;
      }
    }

    // Navigate based on score or logic
    if (score < 10) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FairSkinResultPage(
            title: 'Fair',
            description:
                'You tend to tan easily and are less likely to burn. But you are still at risk of developing melanoma.\n\n In addition to adopting preventive behaviors, such as protection from sun exposure, it is recommended to check your skin head-to-toe every three months, paying careful attention to any suspicious growth.\n\nFor any suspicious skin spots, it is recommended to use Derma to take photos for analysis and keeping track of potential growth. This allows you to keep better track of your skin and bring more fact-based information to a skin checkup with your healthcare professional.',
          ),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FairSkinResultPage(
            title: 'Olive',
            description:
                'You sometimes burn and sometimes tan in the sun. You are susceptible to skin damage as well as cancers like basal cell carcinoma and squamous cell carcinoma. You are at higher risk of developing melanoma.\n\nIn addition to adopting preventive behaviors, such as protection from sun exposure, it is recommended to check your skin head-to-toe every three months, paying careful attention to any suspicious growth.\n\nFor any suspicious skin spots, it is recommended to use Derma to take photos for analysis and keeping track of potential growth. This allows you to keep better track of your skin and bring more fact-based information to a skin checkup with your healthcare professional. ',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[widget.questionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Skin Type',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    question.questionText,
                    style: const TextStyle(
                        color: Color(0xff607C6D), fontSize: 25.0),
                  ),
                  const SizedBox(height: 20),
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
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: 40,
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
                      ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF607C6D),
                        ),
                        onPressed: () {
                          if (selectedAnswer == "") {
                            VxToast.show(context,
                                msg: "Please Select the Options");
                          } else {
                            if (widget.questionIndex <
                                widget.questions.length - 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SkinTypePage(
                                    questionIndex: widget.questionIndex + 1,
                                    answerModel: widget.answerModel,
                                    questions: widget.questions,
                                  ),
                                ),
                              );
                            } else {
                              // Done button pressed - evaluate and navigate
                              evaluateAndNavigate();
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
}
