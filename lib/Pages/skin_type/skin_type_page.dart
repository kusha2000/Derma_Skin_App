import 'package:flutter/material.dart';
import 'package:derma_skin_app/Pages/Risk_Profile/risk_question.dart';
import 'package:derma_skin_app/Pages/Risk_Profile/risk_answer_model.dart';
import 'package:derma_skin_app/Pages/Risk_Profile/risk_result_page.dart';
import 'package:velocity_x/velocity_x.dart';

class SkinTypePage extends StatefulWidget {
  final int questionIndex;
  final AnswerRiskModel answerModel;
  final List<Question> questions;

  const SkinTypePage({
    super.key,
    required this.questionIndex,
    required this.answerModel,
    required this.questions,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SkinTypePageState createState() => _SkinTypePageState();
}

class _SkinTypePageState extends State<SkinTypePage> {
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
                  const SizedBox(
                    height: 20,
                  ),
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
                          width: widget.questionIndex == 0
                              ? MediaQuery.of(context).size.width * 0.5
                              : MediaQuery.of(context).size.width * 0.35,
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
                      width: widget.questionIndex == 0
                          ? MediaQuery.of(context).size.width * 0.5
                          : MediaQuery.of(context).size.width * 0.35,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFF607C6D), // Background color
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RiskResultPage(
                                      answerModel: widget.answerModel),
                                ),
                              );
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
