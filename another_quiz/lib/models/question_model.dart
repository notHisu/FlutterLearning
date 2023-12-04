/* class MultipleChoicesQuestionModel {
  String? question;
  Map<String, bool>? answers;
  MultipleChoicesQuestionModel({this.question, this.answers});

  factory MultipleChoicesQuestionModel.fromJson(Map<String, dynamic> json) {
    return MultipleChoicesQuestionModel(
        question: json['question'],
        answers: Map<String, bool>.from(json['answer']));
  }
} */

/* class MultipleChoicesQuestionModel {
  String question;
  Map<String, bool> answers;
  MultipleChoicesQuestionModel({required this.question, required this.answers});
  String get _question => question;
  Map<String, bool> get _answers => answers;
}
 */

class MultipleChoicesQuestionModel {
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;

  MultipleChoicesQuestionModel({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
  });
}

class Option {
  final String text;
  final bool isCorrect;

  const Option({
    required this.text,
    required this.isCorrect,
  });
}

class MultipleResponsesQuestionModel {
  String? question;
  Map<String, bool>? answers;
  MultipleResponsesQuestionModel(this.question, this.answers);
}

class AudioQuestionModel {
  String? question;
  String? audioUrl;
  Map<String, bool>? answers;
  AudioQuestionModel(this.question, this.audioUrl, this.answers);
}

class VideoQuestionModel {
  String? question;
  String? videoUrl;
  Map<String, bool>? answers;
  VideoQuestionModel(this.question, this.videoUrl, this.answers);
}

class PictureQuestionModel {
  String? question;
  String? pictureUrl;
  Map<String, bool>? answers;
  PictureQuestionModel(this.question, this.pictureUrl, this.answers);
}

class MatchThePairQuestionModel {
  Map<String, String>? pairs;
  Map<String, String>? userPairs;
  MatchThePairQuestionModel(this.pairs, this.userPairs);
}
