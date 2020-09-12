import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerChoosen;
  final int questionIndex;

  Quiz({@required this.questions,
  @required this.answerChoosen,
  @required this.questionIndex,});

  @override
  Widget build(BuildContext context) {
    return Column(
       children: <Widget>[
         SizedBox(height: 80,),
          Positioned(
            top: 80, 
            child: Text("Answer Honestly !!", style: TextStyle(color: Colors.white),)),
          SizedBox(height: 20,),
          Question(questions[questionIndex]['questionText']),
          SizedBox(height: 70,),
          ...(questions[questionIndex]['answers'] as List<Map<String,Object>>).map((answer) {
            return Answers(()=>answerChoosen(answer['score']),answer['text']);
          }).toList()

        ],
      ); 
  }
}