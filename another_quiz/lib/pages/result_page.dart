import 'package:another_quiz/models/question.dart';
import 'package:another_quiz/pages/check_answers.dart';
import 'package:another_quiz/theme/color.dart';
import 'package:flutter/material.dart';

class QuizFinishedPage extends StatefulWidget {
  final List<Question> questions;
  final Map<int, dynamic> answers;

  const QuizFinishedPage(
      {Key? key, required this.questions, required this.answers})
      : super(key: key);

  @override
  _QuizFinishedPageState createState() => _QuizFinishedPageState();
}

class _QuizFinishedPageState extends State<QuizFinishedPage> {
  int? correctAnswers;

  @override
  Widget build(BuildContext context) {
    int correct = 0;
    this.widget.answers.forEach((index, value) {
      if (this.widget.questions[index].correctAnswer == value) correct++;
    });
    const TextStyle titleStyle = TextStyle(
        color: Colors.black87, fontSize: 16.0, fontWeight: FontWeight.w500);
    final TextStyle trailingStyle = TextStyle(
        color: primaryColor, fontSize: 20.0, fontWeight: FontWeight.bold);

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        title: const Text(
          "Result",
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [primaryColor, secondaryColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: const Text("Total Questions", style: titleStyle),
                  trailing:
                      Text("${widget.questions.length}", style: trailingStyle),
                ),
              ),
              const SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: const Text("Score", style: titleStyle),
                  trailing: Text("${correct / widget.questions.length * 100}%",
                      style: trailingStyle),
                ),
              ),
              const SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: const Text("Correct Answers", style: titleStyle),
                  trailing: Text("$correct/${widget.questions.length}",
                      style: trailingStyle),
                ),
              ),
              const SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: const Text("Incorrect Answers", style: titleStyle),
                  trailing: Text(
                      "${widget.questions.length - correct}/${widget.questions.length}",
                      style: trailingStyle),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: primaryColor.withOpacity(0.8),
                    ),
                    child: const Text("Goto Home"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: primaryColor,
                    ),
                    child: const Text("Check Answers"),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => CheckAnswersPage(
                                questions: widget.questions,
                                answers: widget.answers,
                              )));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
