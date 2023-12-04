import 'package:another_quiz/models/category.dart';
import 'package:another_quiz/models/question.dart';
import 'package:another_quiz/pages/quiz_details.dart';
import 'package:another_quiz/services/load_data.dart';
import 'package:another_quiz/theme/color.dart';
import 'package:flutter/material.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
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
        title: const Text(
          'Select',
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {
                loadQuestionThenNavigate(category);
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      category.imagePath,
                      height: 70,
                      width: 70,
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            category.description,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right),
                  ],
                ),
              ),
            );
          }),
    );
  }

  void loadQuestionThenNavigate(Category category) async {
    final listQuestions = await getQuestionsFromFile(category.questionPath);
    await navigateToQuizDetails(category, listQuestions);
  }

  navigateToQuizDetails(Category category, List<Question> listQuestions) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizDetailsPage(
          selectedCategory: category,
          listQuestions: listQuestions,
        ),
      ),
    );
  }
}
