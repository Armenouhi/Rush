class QuizModel {
  List<Questions>? questions;

  QuizModel({this.questions});

  QuizModel.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? questionId;
  String? questionText;
  int? questionSeconds;
  String? questionImageUrl;
  List<Answers>? answers;

  Questions(
      {this.questionId,
      this.questionText,
      this.questionSeconds,
      this.questionImageUrl,
      this.answers});

  Questions.fromJson(Map<String, dynamic> json) {
    questionId = json['question_id'];
    questionText = json['question_text'];
    questionSeconds = json['question_seconds'];
    questionImageUrl = json['question_image_url'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question_id'] = questionId;
    data['question_text'] = questionText;
    data['question_seconds'] = questionSeconds;
    data['question_image_url'] = questionImageUrl;
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answers {
  String? answerText;
  String? answerId;
  bool? correctAnswer;

  Answers({this.answerText, this.answerId, this.correctAnswer});

  Answers.fromJson(Map<String, dynamic> json) {
    answerText = json['answer_text'];
    answerId = json['answer_id'];
    correctAnswer = json['correct_answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['answer_text'] = answerText;
    data['answer_id'] = answerId;
    data['correct_answer'] = correctAnswer;
    return data;
  }
}
