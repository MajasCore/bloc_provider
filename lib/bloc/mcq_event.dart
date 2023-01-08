part of 'mcq_bloc.dart';


abstract class McqEvent extends Equatable{
  const McqEvent();

  @override
  List<Object> get props => [];
}

class LoadMcqEvent extends McqEvent {
  final List<Question> quest;
  const LoadMcqEvent({this.quest = const <Question>[]});

   @override
  List<Object> get props => [quest];
}

class NextMcqEvent extends McqEvent {
  final Question question;
  final int index;
  
  const NextMcqEvent(this.question, this.index);
  
  @override
  List<Object> get props => [question];
}

class HelperMcqEvent extends McqEvent {
  final Question question;
  
  const HelperMcqEvent(this.question);
  
  @override
  List<Object> get props => [question];
}

class FinishedMcqEvent extends McqEvent {}


