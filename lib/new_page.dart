import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "berkay",
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.green, BlendMode.modulate),
                child: FlutterLogo(size: 256),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
