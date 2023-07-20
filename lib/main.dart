import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:  MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/1.jpg'
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment.center,
              end: Alignment.bottomCenter,
            colors: [Colors.black12,Colors.black87],
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(height: 200,),
          Text('First Try',style: TextStyle(color: Colors.white24,fontSize: 18),)
          
        ],
      ),
    );
  }
}

