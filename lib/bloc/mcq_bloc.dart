import 'package:bloc/bloc.dart';
import 'package:bloc_mcq/model/mcq_model.dart';
import 'package:equatable/equatable.dart';


part 'mcq_event.dart';
part 'mcq_state.dart';

class McqBloc extends Bloc<McqEvent, McqState> {
  McqBloc() : super(McqInitial()) {

    void _onLoadMcq(LoadMcqEvent event, Emitter<McqState> emit){
      emit(
        McqLoaded(questions: event.quest),
      );
    }

    void _onNextMcq(NextMcqEvent event, Emitter<McqState> emit){}

    void _onHelperMcq(HelperMcqEvent event, Emitter<McqState> emit){}

    void _onFinishedMcq(FinishedMcqEvent event, Emitter<McqState> emit){}

    on<LoadMcqEvent>(_onLoadMcq);

    on<NextMcqEvent>(_onNextMcq);

    on<HelperMcqEvent>(_onHelperMcq);

    on<FinishedMcqEvent>(_onFinishedMcq);

    
    /*on<LoadMcqEvent>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const McqLoaded(questions: <Question>[]));
    });

    on<NextMcqEvent>((event, emit) {
      if (state is McqLoaded){
        final state = this.state as McqLoaded;
        emit(
          McqLoaded(questions: List.from(state.questions)..add(event.question)),
        );
      }
    });

    on<HelperMcqEvent>((event, emit) {

    });

    on<FinishedMcqEvent>((event, emit) {

    });*/
  }
}
