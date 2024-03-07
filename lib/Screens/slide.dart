// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Slidable Example',
//       home: Scaffold(
//         body: ListView(
//           children: [
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void doNothing(BuildContext context) {}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [FittedBox].

void main() => runApp(const FittedBoxApp());

class FittedBoxApp extends StatelessWidget {
  const FittedBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('FittedBox Sample')),
        body: const Center(
          child: textFactor(),
        ),
      ),
    );
  }
}

class FittedBoxExample extends StatelessWidget {
  const FittedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      color: Colors.blue,
      child: const FittedBox(
        fit: BoxFit.fill,
        child: Placeholder(),
      ),
    );
  }
}

class Flexible123 extends StatelessWidget {
  const Flexible123({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              height: 500,
              width: 500,
              color: Colors.amber,
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              height: 500,
              width: 500,
              color: Colors.green,
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              height: 500,
              width: 500,
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}

class wrap extends StatelessWidget {
  const wrap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        children: [
          Container(
            height: 500,
            width: 500,
            color: Colors.amber,
          ),
          Container(
            height: 500,
            width: 500,
            color: Colors.green,
          ),
          Container(
            height: 500,
            width: 500,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

class textFactor extends StatelessWidget {
  const textFactor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Hello ',
            style: TextStyle(fontSize: 100),
          ),
          Text(
            'world',
            textScaler: TextScaler.linear(5),
          ),
          AutoSizeText(
            'Hello',
            style: TextStyle(fontSize: 100),
            maxLines: 4,
          )
        ],
      ),
    );
  }
}
