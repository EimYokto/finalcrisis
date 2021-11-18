import 'package:finalcrisis/config/constant.dart';
import 'package:finalcrisis/main.dart';
import 'package:finalcrisis/screen/routes/2favorite/stressed/quiz.dart';
import 'package:finalcrisis/screen/routes/2favorite/stressed/result.dart';
import 'package:flutter/material.dart';

class stressed extends StatefulWidget {
  const stressed({Key? key}) : super(key: key);

  @override
  _stressedState createState() => _stressedState();
}

class _stressedState extends State<stressed> {
  final _questions = const [
    {
      'questionText': 'Q1. มีปัญหาการนอน นอนไม่หลับหรือนอนมาก',
      'answers': [
        {'text': 'แทบไม่มี', 'score': 0},
        {'text': 'เป็นบางครั้ง', 'score': 1},
        {'text': 'บ่อยครั้ง', 'score': 2},
        {'text': 'เป็นประจำ', 'score': 3},
      ],
    },
    {
      'questionText': 'Q2. สมาธิน้อยลง',
      'answers': [
        {'text': 'แทบไม่มี', 'score': 0},
        {'text': 'เป็นบางครั้ง', 'score': 1},
        {'text': 'บ่อยครั้ง', 'score': 2},
        {'text': 'เป็นประจำ', 'score': 3},
      ],
    },
    {
      'questionText': ' Q3. หงุดหงิด/กระวนกระวาย/ว้าวุ่นใจ',
      'answers': [
        {'text': 'แทบไม่มี', 'score': 0},
        {'text': 'เป็นบางครั้ง', 'score': 1},
        {'text': 'บ่อยครั้ง', 'score': 2},
        {'text': 'เป็นประจำ', 'score': 3},
      ],
    },
    {
      'questionText': 'Q4. สึกเบื่อ เซ็ง',
      'answers': [
        {'text': 'แทบไม่มี', 'score': 0},
        {'text': 'เป็นบางครั้ง', 'score': 1},
        {'text': 'บ่อยครั้ง', 'score': 2},
        {'text': 'เป็นประจำ', 'score': 3},
      ],
    },
    {
      'questionText': 'Q5. ไม่อยากพบปะผู้คน',
      'answers': [
        {'text': 'แทบไม่มี', 'score': 0},
        {'text': 'เป็นบางครั้ง', 'score': 1},
        {'text': 'บ่อยครั้ง', 'score': 2},
        {'text': 'เป็นประจำ', 'score': 3},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    onPressed:
    () => _questionIndex = 0;
    _totalScore = 0;
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    onPressed:
    () => _questionIndex = _questionIndex + 1;

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('เคลียดมั้ย'),
        backgroundColor: Color(0xFF00E676),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              ) //Quiz
            : Result(_totalScore, _resetQuiz),
      ), //Padding
      //Scaffoldfold
    );
  }
}
