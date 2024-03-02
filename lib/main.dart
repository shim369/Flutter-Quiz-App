import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('4択クイズ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 70,
              color: Colors.red,
              child: const Center(
                child: Text(
                  '回答を選択してください',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
              height: 70,
              color: Colors.green,
              child: const Center(
                child: Text(
                  'Q1',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Container(
              color: Colors.yellow,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    'Q.text text text text text text',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TextButton(
                          onPressed: null,
                          child: Text('A.1'),
                        )
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        onPressed: null,
                        child: Text('A.2'),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        onPressed: null,
                        child: Text('A.3'),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        onPressed: null,
                        child: Text('A.4'),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}