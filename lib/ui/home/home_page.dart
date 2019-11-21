import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter/ui/bloc/state/counter_state.dart';
import 'package:starter/ui/bloc/counter_bloc.dart';
import 'package:starter/ui/preference/preference_page.dart';
import 'package:toast/toast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to the PreferencePage

                        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PreferencePage()),
            );
                     
                  
              Toast.show("Toast plugin app", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
            },
          )
        ],
      ),
      body: Container(
        child: MyHomePage(title:"Flutter"),
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _counterBloc = CounterBloc();
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) =>CounterBloc(),
      child: CounterWidget(widget: widget),
    );
  }

  @override
  void dispose() {
    _counterBloc.close();
    super.dispose();
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final MyHomePage widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
          bloc: BlocProvider.of<CounterBloc>(context),
          builder: (context, CounterState state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  
                  Text(
                    '${state.counter}',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () =>
                BlocProvider.of<CounterBloc>(context).onIncrement(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () =>
                BlocProvider.of<CounterBloc>(context).onDecrement(),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}