import 'dart:async';

import 'package:another_quiz/components/audio_player.dart';
import 'package:another_quiz/components/timer.dart';
import 'package:another_quiz/components/video_player.dart';
import 'package:another_quiz/models/category.dart';
import 'package:another_quiz/models/question.dart';
import 'package:another_quiz/pages/result_page.dart';
import 'package:another_quiz/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class QuizPage extends StatefulWidget {
  final int timeLimit;
  final List<Question> questions;
  final Category? category;
  const QuizPage(
      {Key? key,
      required this.questions,
      required this.category,
      required this.timeLimit})
      : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Question> testQuestions = [
    // Multiple Choices
    Question(
        categoryName: "Entertainment: Video Games",
        type: Type.multipleChoices,
        question: "What was the first game to be released on the Xbox 360?",
        correctAnswers: [
          "Call of Duty 2"
        ],
        incorrectAnswers: [
          "The Elder Scrolls IV: Oblivion",
          "Perfect Dark Zero",
          "Kameo: Elements of Power"
        ]),

    // Multiple Responses
    Question(
        categoryName: "Science: Biology",
        type: Type.multipleResponses,
        question: "What are the four major macromolecules essential for life?",
        correctAnswers: [
          "Carbohydrates",
          "Lipids",
          "Proteins",
          "Nucleic acids"
        ],
        incorrectAnswers: [
          "Vitamins",
          "Minerals",
          "Water",
          "Enzymes"
        ]),

    // Video
    Question(
        categoryName: "Science: Biology",
        type: Type.video,
        path: 'lib/videos/test.mp4',
        question:
            "Watch the video of the heart beating and identify the different parts of the heart.",
        correctAnswers: [
          "Answer"
        ],
        incorrectAnswers: [
          "Wrong answer 1",
          "Wrong answer 2",
          "Wrong answer 3"
        ]),

    // Picture
    Question(
        categoryName: "Art",
        type: Type.picture,
        path:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Earth%27s_Location_in_the_Universe_SMALLER_%28JPEG%29.jpg/1280px-Earth%27s_Location_in_the_Universe_SMALLER_%28JPEG%29.jpg",
        question: "Identify the painting 'The Kiss' by Gustav Klimt.",
        correctAnswers: [
          "Something"
        ],
        incorrectAnswers: [
          "Wrong answer 1",
          "Wrong answer 2",
          "Wrong answer 3"
        ]),

    // Audio
    Question(
        categoryName: "Music",
        type: Type.audio,
        path: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
        question:
            "Listen to the song 'Imagine' by John Lennon and identify the artist.",
        correctAnswers: ["John Lennon"],
        incorrectAnswers: ["The Beatles", "Paul McCartney", "George Harrison"]),
  ];

  final TextStyle questionStyle = const TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.black87);

  int currentIndex = 0;

  final Map<int, dynamic> answers = {};
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    //Question question = testQuestions[currentIndex];
    Question question = widget.questions[currentIndex];
    //print(question);
    final List<dynamic> options = question.incorrectAnswers!;
    for (final dynamic item in question.correctAnswers!) {
      if (!options.contains(item)) {
        options.add(item);
        options.shuffle();
      }
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        key: key,
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: Text(widget.category!.name),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                decoration: BoxDecoration(color: secondaryColor),
                height: 350,
              ),
            ),
            Column(
              children: [
                TimerWidget(
                    timeLimit: widget.timeLimit,
                    onTimerExpired: onTimerExpired),
                // MultipleChoices(currentIndex: currentIndex, question: question),
                // added switch statement to handle different question types
                switch (question.type) {
                  Type.multipleChoices =>
                    multipleChoices(context, question, options),
                  //Type.multipleResponses =>
                  // multipleResponses(context, question, options),
                  Type.picture => picture(context, question, options),
                  Type.video => video(context, question, options),
                  Type.audio => audio(context, question, options),
                  _ => multipleChoices(context, question, options),
                },

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: MediaQuery.of(context).size.width > 800
                            ? const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 64.0)
                            : null,
                        backgroundColor: buttonColor,
                      ),
                      onPressed: nextSubmit,
                      child: Text(
                        currentIndex == (widget.questions.length - 1)
                            ? "Submit"
                            : "Next",
                        style: MediaQuery.of(context).size.width > 800
                            ? const TextStyle(fontSize: 30.0)
                            : null,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget multipleChoices(
      BuildContext context, Question question, List<dynamic> options) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white70,
                child: Text("${currentIndex + 1}"),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  question.question!,
                  softWrap: true,
                  style: MediaQuery.of(context).size.width > 800
                      ? questionStyle.copyWith(fontSize: 30.0)
                      : questionStyle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ...options.map((option) => RadioListTile(
                      title: Text(
                        '$option',
                        style: MediaQuery.of(context).size.width > 800
                            ? const TextStyle(fontSize: 30.0)
                            : null,
                      ),
                      groupValue: answers[currentIndex],
                      value: option,
                      activeColor: Colors.grey,
                      onChanged: (dynamic value) {
                        setState(() {
                          answers[currentIndex] = option;
                        });
                      },
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget multipleResponses(
      BuildContext context, Question question, List<dynamic> options) {
    Map<dynamic, bool> listToMap(List<dynamic> list) {
      final Map<dynamic, bool> map = {};
      for (final dynamic item in list) {
        map[item] = false;
      }
      return map;
    }

    Map<dynamic, bool> optionsMap = listToMap(options);
    List<dynamic> selectedOptions = [];

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white70,
                child: Text("${currentIndex + 1}"),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  question.question!,
                  softWrap: true,
                  style: MediaQuery.of(context).size.width > 800
                      ? questionStyle.copyWith(fontSize: 30.0)
                      : questionStyle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Card(
            child: Column(
              children: [
                ListView(
                  shrinkWrap: true,
                  children: optionsMap.entries.map((entry) {
                    final key = entry.key;
                    final value = entry.value;
                    return CheckboxListTile(
                      title: Text(key),
                      value: value,
                      onChanged: (newValue) {
                        setState(() {
                          optionsMap[key] = newValue!;
                          if (newValue) {
                            selectedOptions.add(key);
                          } else {
                            selectedOptions.remove(key);
                          }
                          answers[currentIndex] = selectedOptions;
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget picture(
      BuildContext context, Question question, List<dynamic> options) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white70,
                child: Text("${currentIndex + 1}"),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  question.question!,
                  softWrap: true,
                  style: MediaQuery.of(context).size.width > 800
                      ? questionStyle.copyWith(fontSize: 30.0)
                      : questionStyle,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              question.path!,
            ),
          ),
          // Image
          const SizedBox(height: 20.0),

          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ...options.map((option) => RadioListTile(
                      title: Text(
                        '$option',
                        style: MediaQuery.of(context).size.width > 800
                            ? const TextStyle(fontSize: 30.0)
                            : null,
                      ),
                      groupValue: answers[currentIndex],
                      value: option,
                      activeColor: Colors.grey,
                      onChanged: (dynamic value) {
                        setState(() {
                          answers[currentIndex] = option;
                        });
                      },
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget video(BuildContext context, Question question, List<dynamic> options) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white70,
                child: Text("${currentIndex + 1}"),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  question.question!,
                  softWrap: true,
                  style: MediaQuery.of(context).size.width > 800
                      ? questionStyle.copyWith(fontSize: 30.0)
                      : questionStyle,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: VideoPlayerWidget(videoUrl: question.path!),
          ),

          // Video Player

          const SizedBox(height: 20.0),

          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ...options.map((option) => RadioListTile(
                      title: Text(
                        '$option',
                        style: MediaQuery.of(context).size.width > 800
                            ? const TextStyle(fontSize: 30.0)
                            : null,
                      ),
                      groupValue: answers[currentIndex],
                      value: option,
                      activeColor: Colors.grey,
                      onChanged: (dynamic value) {
                        setState(() {
                          answers[currentIndex] = option;
                        });
                      },
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget audio(BuildContext context, Question question, List<dynamic> options) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white70,
                child: Text("${currentIndex + 1}"),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  question.question!,
                  softWrap: true,
                  style: MediaQuery.of(context).size.width > 800
                      ? questionStyle.copyWith(fontSize: 30.0)
                      : questionStyle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          AudioPlayerWidget(audioUrl: question.path!),
          const SizedBox(height: 20.0),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ...options.map((option) => RadioListTile(
                      title: Text(
                        '$option',
                        style: MediaQuery.of(context).size.width > 800
                            ? const TextStyle(fontSize: 30.0)
                            : null,
                      ),
                      groupValue: answers[currentIndex],
                      value: option,
                      activeColor: Colors.grey,
                      onChanged: (dynamic value) {
                        setState(() {
                          answers[currentIndex] = option;
                        });
                      },
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void nextSubmit() {
    if (answers[currentIndex] == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("You must select an answer to continue."),
      ));
      return;
    }
    if (currentIndex < (testQuestions.length - 1)) {
      setState(() {
        currentIndex++;
      });
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) =>
              QuizFinishedPage(questions: testQuestions, answers: answers)));
    }
  }

  void onTimerExpired() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) =>
            QuizFinishedPage(questions: testQuestions, answers: answers)));
  }

  Future<bool> onWillPop() async {
    final resp = await showDialog<bool>(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: const Text(
                "Are you sure you want to quit the quiz? All your progress will be lost."),
            title: const Text("Warning!"),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "Yes",
                  style: TextStyle(color: primaryColor),
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              TextButton(
                child: Text("No", style: TextStyle(color: primaryColor)),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          );
        });
    return resp ?? false;
  }
}
