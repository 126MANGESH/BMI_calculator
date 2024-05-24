import 'package:bmi_app/cross_fed.dart';
import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  AnimationPageViewState createState() => AnimationPageViewState();
}

class AnimationPageViewState extends State<AnimationPage> {
  double _height = 200.0;
  double _width = 100.0;
  bool flag = true;

  Decoration _myDecoration = BoxDecoration(
    color: Colors.blue,
    border: const Border(),
    borderRadius: BorderRadius.circular(10),
  );

  void _toggleAnimation() {
    setState(() {
      if (flag) {
        _height = 200.0;
        _width = 100.0;
        flag = false;
        _myDecoration = BoxDecoration(
          color: Colors.deepOrange,
          border: const Border(),
          borderRadius: BorderRadius.circular(24),
        );
      } else {
        _height = 100.0;
        _width = 200.0;
        flag = true;
        _myDecoration = BoxDecoration(
          color: Colors.purple,
          border: const Border(),
          borderRadius: BorderRadius.circular(24),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CrossfedAnimationpage()),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              height: _height,
              width: _width,
              decoration: _myDecoration,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
            ),
            const SizedBox(height: 11),
            ElevatedButton(
              onPressed: _toggleAnimation,
              child: const Text('Press'),
            ),
            const SizedBox(height: 11),
            OutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: ((context) => const BmiPage())),
                );
              },
              child: const Text('BMI'),
            ),
          ],
        ),
      ),
    );
  }
}
