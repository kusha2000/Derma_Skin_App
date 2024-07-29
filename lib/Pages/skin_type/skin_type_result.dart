import 'package:flutter/material.dart';
import 'package:derma_skin_app/Pages/Risk_Profile/risk_answer_model.dart';

class SkinTypeResult extends StatelessWidget {
  final AnswerRiskModel answerModel;

  const SkinTypeResult({super.key, required this.answerModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Results')),
      body: ListView.builder(
        itemCount: answerModel.answers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Question ${index + 1}'),
            subtitle: Text('Answer: ${answerModel.answers[index]}'),
          );
        },
      ),
    );
  }
}
