import 'package:bloc/bloc.dart';
import 'package:starter/ui/bloc/event/counter_event.dart';
import 'package:starter/ui/bloc/state/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState>{

  void onIncrement(){
    add(IncrementEvent());
  }
  void onDecrement(){
    add(DecrementEvent());
  }
  @override
  CounterState get initialState => CounterState.initial();

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    
    if(event is IncrementEvent){
      yield CounterState(counter: state.counter+=1);
    }
    else if(event is DecrementEvent){
      yield CounterState(counter: state.counter-=1);
    }
  }

}