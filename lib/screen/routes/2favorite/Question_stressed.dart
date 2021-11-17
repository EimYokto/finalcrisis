// To parse this JSON data, do
//
//     final questionStressed = questionStressedFromJson(jsonString);

import 'dart:convert';

QuestionStressed questionStressedFromJson(String str) =>
    QuestionStressed.fromJson(json.decode(str));

String questionStressedToJson(QuestionStressed data) =>
    json.encode(data.toJson());

class QuestionStressed {
  QuestionStressed({
    this.title,
    this.choices,
    this.answerId,
  });

  String? title;
  List<Choice>? choices;
  int? answerId;

  factory QuestionStressed.fromJson(Map<String, dynamic> json) =>
      QuestionStressed(
        title: json["title"] == null ? null : json["title"],
        choices: json["choices"] == null
            ? null
            : List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
        answerId: json["answerID"] == null ? null : json["answerID"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "choices": choices == null
            ? null
            : List<dynamic>.from(choices!.map((x) => x.toJson())),
        "answerID": answerId == null ? null : answerId,
      };
}

class Choice {
  Choice({
    this.id,
    this.title,
  });

  int? id;
  String? title;

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
      };
}
