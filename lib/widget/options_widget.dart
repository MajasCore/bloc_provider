import 'package:bloc_mcq/bloc/mcq_bloc.dart';
import 'package:bloc_mcq/model/mcq_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OptionsWidget extends StatelessWidget {
  
  final McqLoaded ostate;
  final int index;
  final ValueChanged<Choice> onClickedOption;
  
  const OptionsWidget({
    Key? key, 
    required this.ostate,
    required this.index,
    required this.onClickedOption,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<McqBloc, McqState>(
      builder: (context, state) {
        return ListView(
          physics: const BouncingScrollPhysics(),
          children: ostate.questions[index].choices.map((choice) => buildOption(context, choice)).toList(),
        );
        
      },
    );
  }
  Widget buildOption(BuildContext context, Choice choice){
          return GestureDetector(
            onTap: () {
              if(choice.choice == ostate.questions[index].correctAnswer){
                print('correct');
                ostate.questions[index].choices.remove(choice);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              child: buildAnswer(choice)),
          );
  }
  Widget buildAnswer(Choice choice){
    return Container(
      height: 50,
      child: Row(
        children: [
          Text(
            choice.choice,
          ),
        ],
      ),
    );
  }
}