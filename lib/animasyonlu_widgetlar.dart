import 'package:flutter/material.dart';

class AnimasyonluWidgetlar extends StatefulWidget {
  const AnimasyonluWidgetlar({super.key});

  @override
  State<AnimasyonluWidgetlar> createState() => _AnimasyonluWidgetlarState();
}

class _AnimasyonluWidgetlarState extends State<AnimasyonluWidgetlar> {
  var _color = Colors.pink;
  var _height = 200.0;
  var _width = 200.0;
  var ilkCocukAktif = false;
  var _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animasyonlu Widgetlar")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AnimatedContainer(
                height: _height,
                width: _width,
                duration: Duration(seconds: 2),
                color: _color,
              ),
              OutlinedButton(
                onPressed: () {
                  _containerAnimasyonu();
                },
                style: OutlinedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text(
                  "Animasyonlu Container",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              AnimatedCrossFade(
                firstChild: Image.network(
                  "https://codit.com.tr/media/blog/34/network-nedir-network-cesitleri-ve-iletisim-protokolleri.jpg",
                ),
                secondChild: Image.network(
                  "https://www.avansas.com/blog/wp-content/uploads/2023/02/network-nedir-is-hayatinda-cevrenizi-gelistirmenin-yollari-950x500.jpeg",
                ),
                crossFadeState: ilkCocukAktif
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(seconds: 3),
              ),
              OutlinedButton(
                onPressed: () {
                  _crossFadeAnimasyonu();
                },
                style: OutlinedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text(
                  "Cross fade animasyonu",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 2),
                child: FlutterLogo(size: 150),
              ),
              OutlinedButton(
                onPressed: () {
                  _opacityAnimasyonu();
                },
                style: OutlinedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text(
                  "Opacity Animasyonu",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _containerAnimasyonu() {
    setState(() {
      _color = _color == Colors.pink ? Colors.yellow : Colors.pink;
      _height = _height == 200 ? 300 : 200;
      _width = _width == 200 ? 300 : 200;
    });
  }

  void _crossFadeAnimasyonu() {
    setState(() {
      ilkCocukAktif = !ilkCocukAktif;
    });
  }

  void _opacityAnimasyonu() {
    setState(() {
      _opacity = _opacity == 1 ? 0 : 1;
    });
  }
}
