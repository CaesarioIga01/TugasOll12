import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oll12/color_bloc2.dart';

class FlutterPackagePage extends StatefulWidget {
  @override
  _FlutterPackagePageState createState() => _FlutterPackagePageState();
}

class _FlutterPackagePageState extends State<FlutterPackagePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ColorBloc>(
        builder: (context) => ColorBloc(),
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              bloc.dispatch(ColorEvent.to_grey);
            },
            backgroundColor: Colors.grey,
          ),
          SizedBox(
            width: 20.0,
            height: 30.0,
          ),
          FloatingActionButton(
            onPressed: () {
              bloc.dispatch(ColorEvent.to_limeAccent);
            },
            backgroundColor: Colors.limeAccent,
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(
          "Bloc State Management ( Flutter bloc )",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, currentColor) => AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: 150.0,
            height: 150.0,
            color: currentColor,
          ),
        ),
      ),
    );
  }
}
