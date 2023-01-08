import 'package:bloc_mcq/bloc/mcq_bloc.dart';
import 'package:bloc_mcq/model/mcq_model.dart';
import 'package:bloc_mcq/widget/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => McqBloc()..add(LoadMcqEvent(quest: [Question(
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
    ),]))),
          
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MCQ_bloc',
        theme: ThemeData(   
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  
  //final Question quest = Question();
  int index = 0;
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: BlocBuilder<McqBloc, McqState>(
          builder: ((context, state) {
            print(state);
            
            if (state is McqInitial){
              return const CircularProgressIndicator(color: Colors.black);
            }
            if(state is McqLoaded){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Expanded(child: QuestionWidget(wstate: state)),
                  Text(
                    '${state.questions.length}',
                  ),
                  Text(
                    '${state.questions[index].choices[index].choice}',
                  ),
                  //Text('${state.questions[index].question}'),
                  //Text('${state.questions.first.correctAnswer}'),

                  //Text('${state.questions[index].question}'),
                  
                ], 
              );
            }else {
              return const Text('Something went wrong');
            }           
          }
        ),
      ),
      ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        index += 1;
        context.read<McqBloc>().add(NextMcqEvent(Question.questions[0], index));
        
      },
    ),
    );
  }
  
}