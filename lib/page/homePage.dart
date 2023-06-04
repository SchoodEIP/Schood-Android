import 'package:flutter/material.dart';
import 'profilPage.dart';
import 'package:schood_android/components/bottomNav.dart';

class homePage extends StatefulWidget {

  @override
  State<homePage> createState() => _homeState();
}

class _homeState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  const Color(0xFFE144FB),
                  const Color(0xFF9ADCFF),
                ],
              )
          ),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>profilPage()));
                        },
                        child: const Text('Profil'),
                      ),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}