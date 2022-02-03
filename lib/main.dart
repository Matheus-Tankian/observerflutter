import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:observerflutter/counter.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  TimedCounter _timedCounter = TimedCounter();

  void _toggleCounter() {
    setState(() {
      _timedCounter.toggleCounter();
    });
  }

  @override
  void initState() {
    super.initState();
    _timedCounter.addListener(_refreshScreen);
  }

  @override
  void dispose() {
    super.dispose();

    _timedCounter.removeListener(_refreshScreen);
  }

  void _refreshScreen() {
    setState(() {});
  }

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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              _timedCounter.getValue().toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleCounter,
        tooltip: 'Increment',
        child: _timedCounter.isTimerActive()
            ? Icon(Icons.stop)
            : Icon(Icons.play_arrow),
      ),
    );
  }
}
