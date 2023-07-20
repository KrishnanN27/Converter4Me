import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double weightInKilograms = 0.0;

  final TextEditingController _controller = TextEditingController();
  void _updateWeight(String value) {
    if (value.isEmpty) {
      setState(() {
        weightInKilograms = 0.0;
      });
      return;
    }

    double pounds = double.tryParse(value) ?? 0.0;
    double kilograms = pounds * 0.453592;
    setState(() {
      weightInKilograms = kilograms;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
          colors: [Colors.black, Colors.black12],
          begin: Alignment.bottomCenter,
          end: Alignment.center)
          .createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/2.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken)),
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.white70],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                // const Text('Patience',
                //     style: TextStyle(
                //         color: Colors.white70,
                //         fontSize: 100,
                //         fontFamily: 'dark')),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  '${weightInKilograms.toStringAsFixed(2)} kgs',
                  style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 40,
                      fontFamily: 'maiden'),
                ),
                const SizedBox(height: 25),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(
                        color: Colors.white), // Text color to white
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter weight in pounds',
                      hintStyle: const TextStyle(
                          color: Colors.white70, fontFamily: 'maiden'),
                      filled: true,
                      fillColor: Colors.transparent,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: _updateWeight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}