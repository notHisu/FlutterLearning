import 'package:another_quiz/components/button.dart';
import 'package:another_quiz/components/quiz_options.dart';
import 'package:another_quiz/models/category.dart';
import 'package:another_quiz/models/question.dart';
import 'package:another_quiz/theme/color.dart';
import 'package:flutter/material.dart';

class QuizDetailsPage extends StatefulWidget {
  final Category selectedCategory;
  final List<Question> listQuestions;

  const QuizDetailsPage({
    super.key,
    required this.selectedCategory,
    required this.listQuestions,
  });

  @override
  State<QuizDetailsPage> createState() => _QuizDetailsPageState();
}

class _QuizDetailsPageState extends State<QuizDetailsPage> {
  @override
  Widget build(BuildContext context) {
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
        title: Text(
          widget.selectedCategory.name.substring(0, 7),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(widget.selectedCategory.displayPicturePath),
            ),

            const SizedBox(height: 20),

            // Title
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      widget.selectedCategory.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // About
                    Text(
                      widget.selectedCategory.description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.justify,
                    ),

                    const SizedBox(height: 10),

                    // List of questions
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.listQuestions.length,
                      itemBuilder: (context, index) {
                        final question = widget.listQuestions[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            '${index + 1}. ${question.question}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        );
                      },
                    ),
                  ],
                )),
              ),
            ),

            // Continue button
            MyButton(
                text: "Begin",
                onTap: () => categoryPressed(context, widget.selectedCategory)),
          ],
        ),
      ),
    );
  }

  categoryPressed(BuildContext context, Category selectedCategory) {
    showModalBottomSheet(
      context: context,
      builder: (sheetContext) => BottomSheet(
        builder: (_) => QuizOptionsDialog(
          category: selectedCategory,
          questions: widget.listQuestions,
        ),
        onClosing: () {},
      ),
    );
  }
}
