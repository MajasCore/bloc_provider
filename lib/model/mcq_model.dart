import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Choice{
  String choice;
  String helperText;

  Choice({required this.choice,required this.helperText});
}
class Question extends Equatable{
  final String question;
  final List<Choice> choices;
  final List<String> hintAnswer;
  final String correctAnswer;

  const Question({required this.question,required this.choices,required this.hintAnswer,required this.correctAnswer});
  
  @override 
  List<Object?> get props => [question, choices, hintAnswer, correctAnswer];

  static List<Question> questions = [
    Question(
      question: 'whats your name?',
      hintAnswer: const ['starts with A', 'Ends with N', '5 letter name'],
      choices: [
        Choice(choice: 'MANU', helperText: 'not manu choose wisely'),
        Choice(choice: 'AMEEN', helperText: 'Correct Answer'),
        Choice(choice: 'ALAN', helperText: 'your name has 5 characters'),
        Choice(choice: 'HARI', helperText: 'not hari choose wisely')
      ],
      correctAnswer: 'AMEEN',
    ),
    //2nd quest
    Question(
      question: 'College you studied?',
      hintAnswer: const ['In chennai', 'starts with S', '3 letter name'],
      choices: [
        Choice(choice: 'SRM', helperText: 'Correct Answer'),
        Choice(choice: 'VELS', helperText: 'not vels choose wisely'),
        Choice(choice: 'VIT', helperText: 'not VIT'),
        Choice(choice: 'CRESENT', helperText: 'not CRESENT')
      ],
      correctAnswer: 'SRM',
    ),
    Question(
      question: 'whats your age?',
      hintAnswer: const ['starts with A', 'Ends with N', '5 letter name'],
      choices: [
        Choice(choice: '22', helperText: 'a bit more'),
        Choice(choice: '23', helperText: 'just a bit more'),
        Choice(choice: '24', helperText: 'exactly'),
        Choice(choice: '25', helperText: 'too much')
      ],
      correctAnswer: '24',
    ),

  ];
}

