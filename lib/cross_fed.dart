

import 'dart:async';


import 'package:bmi_app/anime.dart';
import 'package:flutter/material.dart';

class CrossfedAnimationpage extends StatefulWidget{
  const CrossfedAnimationpage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ScrssfedAnimationpagestate();
   
  }
}

class ScrssfedAnimationpagestate extends State <StatefulWidget>{
   bool isfrist =true;
    void relode(){
    setState(() {
      isfrist=false;
    });
   }
   

   @override
     void initState(){
     super.initState();
     Timer(const Duration(seconds:2),() {
      Navigator.push(context,MaterialPageRoute(builder: (context) => const AnimationPage(),));
      relode();
      });
  

    
   }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: const Text('BMI Claculator'),
      backgroundColor: Colors.indigo.shade300 ,
),

body: AnimatedCrossFade(firstChild: Center(
  child: Container(
    height: 300,
    width: 500,
    color: Colors.blueAccent.shade200,
    child: Image.asset('assets/bmi.png',fit: BoxFit.cover,),
  ),

), secondChild:Center(child: Image.asset('assets/bmi.png',height: 300,width: 500,)),
 crossFadeState: isfrist ?CrossFadeState.showFirst:CrossFadeState.showSecond,
  duration: const Duration(seconds: 2)),

  );}}