part of 'mcq_bloc.dart';


abstract class McqState extends Equatable{
  const McqState();

  @override
  List<Object> get props => [];

  
}

class McqInitial extends McqState {}

class McqLoaded extends McqState {
  final List<Question> questions;
  //final Question _question;

  const McqLoaded({this.questions = const <Question>[]});
  
  @override
  List<Object> get props => [questions];
  //Question get getQuestion => _question;
}
