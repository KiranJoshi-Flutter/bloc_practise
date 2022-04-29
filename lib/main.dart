import 'package:flutter/material.dart';
import 'package:flutter_app/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        home: CounterApp(),
      ),
    ),
  );
}

class CounterApp extends StatefulWidget {
  const CounterApp({Key key}) : super(key: key);

  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Counter App"),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, state) {
            return Text(
              '$state',
              style: TextStyle(
                fontSize: 36.0,
              ),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "1",
            backgroundColor: Colors.deepOrange,
            child: Icon(Icons.add),
            onPressed: () {
              counterBloc.add(CounterEvent.Increment);
            },
          ),
          FloatingActionButton(
            heroTag: "2",
            backgroundColor: Colors.deepOrange,
            child: Icon(Icons.remove),
            onPressed: () {
              counterBloc.add(CounterEvent.Decrement);
            },
          ),
          FloatingActionButton(
            heroTag: "3",
            backgroundColor: Colors.deepOrange,
            child: Icon(Icons.loop),
            onPressed: () {
              counterBloc.add(CounterEvent.Reset);
            },
          ),
        ],
      ),
    );
  }
}
