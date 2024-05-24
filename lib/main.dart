import 'package:bmi_app/custormer_files/customers.dart';
import 'package:bmi_app/cross_fed.dart';
import 'package:flutter/material.dart';

import 'anime.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CrossfedAnimationpage(),
    );
  }
}

class BmiPage extends StatefulWidget {
  const BmiPage({super.key,});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  final wtController = TextEditingController();
  final ftController = TextEditingController();
  final inchController = TextEditingController();

  var result = "";
  var backgroundColor = const Color.fromARGB(255, 52, 198, 235);
  var msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const AnimationPage()),
          ),
        ),
        backgroundColor: Colors.deepPurple,
        title: const Center(
          child: Text(
            'BMI',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Container(
            color: backgroundColor,
            child: Center(
              child: SingleChildScrollView(
                child: Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      const Text(
                        'BMI CALCULATOR',
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 25),
                      buildTextField(
                        controller: wtController,
                        labelText: 'Enter the weight (in Kg)!',
                        prefixIcon: Icons.monitor_weight,
                      ),
                      const SizedBox(height: 21),
                      buildTextField(
                        controller: ftController,
                        labelText: 'Enter the Height (in Feet)!',
                        prefixIcon: Icons.height_sharp,
                      ),
                      const SizedBox(height: 21),
                      buildTextField(
                        controller: inchController,
                        labelText: 'Enter the Height (in Inches)!',
                        prefixIcon: Icons.height_sharp,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          calculateBMI();
                        },
                        child: const Text('CALCULATE'),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        result,
                        style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        msg,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const AnimationPage()),
                          );
                        },
                        child: const Text('Back'),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CustomersPage()),
                          );
                        },
                        child: const Text(
                          'Reading',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData prefixIcon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(labelText),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
        focusedBorder:  OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(11),
        ),
        prefixIcon: Icon(prefixIcon),
      ),
      keyboardType: TextInputType.number,
    );
  }

  void calculateBMI() {
    var wt = int.tryParse(wtController.text) ?? 0;
    var ft = int.tryParse(ftController.text) ?? 0;
    var inch = int.tryParse(inchController.text) ?? 0;

    if (wt != 0 && ft != 0 && inch >= 0) {
      var totalInch = (ft * 12) + inch;
      var totalCm = totalInch * 2.54;
      var totalHeight = totalCm / 100;

      var bmi = wt / (totalHeight * totalHeight);

      setState(() {
        if (bmi >= 25) {
          backgroundColor = Colors.red;
          msg = "YOUR OVERWEIGHT!!";
        } else if (bmi <= 18) {
          backgroundColor = Colors.lime;
          msg = "YOUR UNDERWEIGHT!!";
        } else {
          backgroundColor = Colors.green;
          msg = "YOU'RE HEALTHY!!";
        }

        result = bmi.toStringAsFixed(4);
      });
    } else {
      result = "Please fill all information!!";
      setState(() {});
    }
  }
}
