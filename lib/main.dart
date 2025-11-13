import 'package:animations/animasyonlu_widgetlar.dart';
import 'package:animations/new_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  AnimationController? controller;

  //late Animation<double> animation;
  late Animation animation;
  late Animation animation2;
  late Animation animation3;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
      //lowerBound: 0,
      //upperBound: 100,
    );
    controller?.addListener(() {
      setState(() {
        //debugPrint(controller?.value.toString());
        //debugPrint(animation.value.toString());
      });
    });

    //animation = Tween<double>(begin: 20, end: 150).animate(controller!);
    animation = ColorTween(
      begin: Colors.red,
      end: Colors.yellow,
    ).animate(controller!);
    animation2 = AlignmentTween(
      begin: Alignment(-1, -1),
      end: Alignment(1, -1),
    ).animate(controller!);
    animation3 = CurvedAnimation(parent: controller!, curve: Curves.ease);

    controller?.forward();
    controller?.addStatusListener((durum) {
      debugPrint(durum.toString());
      if (durum == AnimationStatus.completed) {
        controller?.reverse().orCancel;
      } else if (durum == AnimationStatus.dismissed) {
        controller?.forward().orCancel;
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: animation3.value * 36),
            ),
            Container(
              alignment: animation2.value,
              child: Text(
                '$_counter',
                style: TextStyle(fontSize: controller!.value + 20),
              ),
            ),
            Hero(tag: "berkay", child: FlutterLogo(size: 64)),
            OutlinedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => NewPage()));
              },
              child: Text("Next Page"),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => AnimasyonluWidgetlar()));
              },
              child: Text("Animasyonlu Widget Sayfası"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
