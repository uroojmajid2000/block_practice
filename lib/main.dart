import 'package:block_practice/cubits/counter/counter_cubit.dart';
import 'package:block_practice/cubits/name/name_cubit.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [

        BlocProvider<NameCubit>(
          create: ((context) => NameCubit()),
        ),

        BlocProvider<CounterCubit>(
          create: ((context) => CounterCubit()),
        ),
      ], 
      child: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
              context.watch<NameCubit>().state.name,
            ),
            Text(
              context.watch<CounterCubit>().state.count.toString(),
              
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              children: [
                FloatingActionButton(
                  onPressed: () => context.read<CounterCubit>().increment(),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () => context.read<CounterCubit>().decrement(),
                  tooltip: 'decrement',
                  child: const Icon(Icons.subscript),
                ),

                 FloatingActionButton(
                  onPressed: () => context.read<NameCubit>().changeName('Alina'),
                  tooltip: 'name',
                  child: const Icon(Icons.safety_divider),
                ),
              ],
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
