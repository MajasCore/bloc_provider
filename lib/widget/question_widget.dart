import 'package:bloc_mcq/bloc/mcq_bloc.dart';
import 'package:bloc_mcq/model/mcq_model.dart';
import 'package:bloc_mcq/widget/options_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionWidget extends StatelessWidget {
  final McqLoaded wstate;
  

  const QuestionWidget({
    Key? key,
    required this.wstate,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<McqBloc, McqState>(
      builder: (context, state) {
        return PageView.builder(
          itemCount: wstate.questions.length,
          itemBuilder: (context, index) {
            

            return buildQuestion(question: wstate, index: index);
          },
        );
      },
    );
  }

  Widget buildQuestion({required McqLoaded question, required int index}) {
    return BlocBuilder<McqBloc, McqState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Text(
              question.questions[index].question,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            const Text(
              'Choose your answer from below',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: OptionsWidget( 
                onClickedOption: (choice) {
                  if(choice.choice == question.questions[index].correctAnswer){
                    print('success');
                  }
                },
                ostate: question,
                index: index,
                //onClickedOption: () {},
              ),
            ),
          ],
        );
      },
    );
  }
}
