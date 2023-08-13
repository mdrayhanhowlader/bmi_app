import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Check BMI',
      color: Colors.white,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Check Your BMI',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title.toUpperCase(),
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BMI',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
                ),
                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                      label: Text('Enter your Weight (in Kgs).'),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 21,
                ),
                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                      label: Text('Enter your Height (in Feet)'),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 11,
                ),
                TextField(
                    controller: inController,
                    decoration: const InputDecoration(
                      label: Text('Enter your Height (in Inches)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                        // BMI Calculation
                        var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);

                        var tInch = (iFt * 12) + iInch;

                        var tCm = tInch * 2.54;

                        var tM = tCm / 100;

                        var bmi = iWt / (tM * tM);

                        var msg = '';

                        if (bmi > 25) {
                          msg = 'You are over weight';
                          bgColor = Colors.orange.shade300;
                        } else if (bmi < 18) {
                          msg = 'You are under weight';
                          bgColor = Colors.red.shade200;
                        } else {
                          msg = 'You are healthy';
                          bgColor = Colors.green.shade200;
                        }

                        setState(() {
                          result =
                              "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                        });
                      } else {
                        setState(() {
                          result = "Please Fill All The Blanks!!";
                        });
                      }
                    },
                    child: const Text('Calculate')),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  result,
                  style: const TextStyle(fontSize: 19),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
