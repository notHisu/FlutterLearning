enum Type { multipleChoices, multipleResponses, picture, video, audio }

class Question {
  final String? categoryName;
  final Type? type;
  final String? question;
  final String? path;
  final List<dynamic>? correctAnswer;
  final List<dynamic>? incorrectAnswers;

  Question(
      {this.categoryName,
      this.type,
      this.path,
      this.question,
      this.correctAnswer,
      this.incorrectAnswers});

  Question.fromMap(Map<String, dynamic> data)
      : categoryName = data["category"],
        type = data["type"] == "multiple"
            ? Type.multipleChoices
            : (data["type"] == "multipleResponse")
                ? Type.multipleResponses
                : (data["type"] == "picture")
                    ? Type.picture
                    : (data["type"] == "video")
                        ? Type.video
                        : (data["type"] == "audio")
                            ? Type.audio
                            : null,
        path = data["path"],
        question = data["question"],
        correctAnswer = data["correct_answer"],
        incorrectAnswers = data["incorrect_answers"];

  static List<Question> fromData(List<Map<String, dynamic>> data) {
    return data.map((question) => Question.fromMap(question)).toList();
  }
}
