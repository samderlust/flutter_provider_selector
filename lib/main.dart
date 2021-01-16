import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => NumberProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ConsummerScreen(),
    );
  }
}

class SelectorScreen extends StatelessWidget {
  const SelectorScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build home');
    return Container(
      child: Scaffold(
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              heroTag: 'all',
              onPressed: () {
                context.read<NumberProvider>().add();
              },
              child: Text('all'),
            ),
            FloatingActionButton(
              heroTag: '1',
              onPressed: () {
                context.read<NumberProvider>().addTo1();
              },
              child: Text('1'),
            ),
            FloatingActionButton(
              heroTag: '2',
              onPressed: () {
                context.read<NumberProvider>().addTo2();
              },
              child: Text('2'),
            ),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Selector<NumberProvider, int>(
                      selector: (_, provider) => provider.number1,
                      builder: (context, number1, child) {
                        print('Build num1');
                        return Container(
                          color: Colors.red,
                          padding: EdgeInsets.all(10),
                          child: Text('$number1'),
                        );
                      }),
                  Selector<NumberProvider, int>(
                      selector: (_, provider) => provider.number2,
                      builder: (context, number2, child) {
                        print('Build num2');
                        return Container(
                          color: Colors.green,
                          padding: EdgeInsets.all(10),
                          child: Text('$number2'),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NumberProvider extends ChangeNotifier {
  int _number1 = 0;
  int _number2 = 1;
  int get number1 => _number1;
  int get number2 => _number2;

  void add() {
    _number1++;
    _number2++;
    notifyListeners();
  }

  void addTo1() {
    _number1++;
    notifyListeners();
  }

  void addTo2() {
    _number2++;
    notifyListeners();
  }
}

class ConsummerScreen extends StatelessWidget {
  const ConsummerScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build home');
    return Container(
      child: Scaffold(
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              heroTag: 'all',
              onPressed: () {
                context.read<NumberProvider>().add();
              },
              child: Text('all'),
            ),
            FloatingActionButton(
              heroTag: '1',
              onPressed: () {
                context.read<NumberProvider>().addTo1();
              },
              child: Text('1'),
            ),
            FloatingActionButton(
              heroTag: '2',
              onPressed: () {
                context.read<NumberProvider>().addTo2();
              },
              child: Text('2'),
            ),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              child: Consumer<NumberProvider>(
                builder: (context, provider, child) {
                  print('rebuild consumer');
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: Colors.red,
                        padding: EdgeInsets.all(10),
                        child: Text('${provider.number1}'),
                      ),
                      Container(
                        color: Colors.green,
                        padding: EdgeInsets.all(10),
                        child: Text('${provider.number2}'),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
