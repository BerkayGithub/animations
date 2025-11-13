import 'package:flutter/material.dart';

class TransformAnimasyon extends StatefulWidget {
  const TransformAnimasyon({super.key});

  @override
  State<TransformAnimasyon> createState() => _TransformAnimasyonState();
}

class _TransformAnimasyonState extends State<TransformAnimasyon> {
  var _sliderDegeri = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transform"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          getSlider(),
          getRotate(),
          getScale(),
          getTransform()
        ],
      ),
    );
  }

  getSlider() {
    return Slider(
        value: _sliderDegeri,
        min: 0.0,
        max: 100.0,
        onChanged: (yeniDeger) {
          setState(() {
            _sliderDegeri = yeniDeger;
          });
        }
    );
  }

  Container getRotate() {
    return Container(
      child: Transform.rotate(
        angle: _sliderDegeri,
        origin: Offset(50, 0.0),
        child: Container(height: 100, width: 100, color: Colors.blue),),
    );
  }

  getScale() {
    return Container(
      child: Transform.scale(
        scale: _sliderDegeri == 0 ? 1 : _sliderDegeri/50,
        child: Container(height: 100, width: 100, color: Colors.blue),),
    );
  }

  getTransform() {
    return Container(
      child: Transform.translate(
        offset: Offset(_sliderDegeri, _sliderDegeri),
        child: Container(height: 100, width: 100, color: Colors.cyan),),
    );
  }
}
