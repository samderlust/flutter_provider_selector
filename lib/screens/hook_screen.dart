import 'package:flutter/material.dart';

class HookDemo extends StatefulWidget {
  @override
  _HookDemoState createState() => _HookDemoState();
}

class _HookDemoState extends State<HookDemo> {
  int _number = 0;
  @override
  void initState() {
    super.initState();
    _number = 1;
    print('hello');
  }

  @override
  void dispose() {
    super.dispose();
    print('goodbye');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _number++;
          });
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          _number.toString(),
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
