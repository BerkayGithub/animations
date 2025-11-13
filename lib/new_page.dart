import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late SequenceAnimation sequenceAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);

    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1),
          from: Duration.zero,
          to: Duration(seconds: 2),
          tag: "opacity",
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 50, end: 150),
          from: Duration(seconds: 0),
          to: Duration(seconds: 1),
          tag: "width",
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 50, end: 150),
          from: Duration(seconds: 1),
          to: Duration(seconds: 2),
          tag: "height",
        )
        .addAnimatable(
          animatable: EdgeInsetsTween(
            begin: EdgeInsets.only(bottom: 15),
            end: EdgeInsets.only(bottom: 75),
          ),
          curve: Curves.ease,
          from: Duration(seconds: 2),
          to: Duration(seconds: 3),
          tag: "padding",
        )
        .addAnimatable(
          animatable: BorderRadiusTween(
            begin: BorderRadius.circular(4),
            end: BorderRadius.circular(75),
          ),
          curve: Curves.ease,
          from: const Duration(milliseconds: 0),
          to: const Duration(milliseconds: 1000),
          tag: "border",
        )
        .addAnimatable(
          animatable: ColorTween(
            begin: Colors.indigo[100],
            end: Colors.orange[400],
          ),
          curve: Curves.ease,
          from: const Duration(milliseconds: 750),
          to: const Duration(milliseconds: 1000),
          tag: "color",
        )
        .animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Page")),
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? widget) {
            return Opacity(
              opacity: sequenceAnimation["opacity"].value,
              child: Container(
                decoration: BoxDecoration(
                  color: sequenceAnimation["color"].value,
                  border: Border.all(
                    width: 3,
                    color: Colors.pink
                  ),
                  borderRadius: sequenceAnimation["border"].value
                ),
                padding: sequenceAnimation["padding"].value,
                width: sequenceAnimation["width"].value,
                height: sequenceAnimation["height"].value,
              ),
            );
          },
        ),
      ),
    );
  }
}
