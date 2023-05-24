import 'package:flutter/material.dart';
import 'connexionPage.dart';

class profilPage extends StatefulWidget {
  const profilPage({super.key});

  @override
  State<profilPage> createState() => _profilState();
}

class _profilState extends State<profilPage> {
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
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>connexionPage()));
                        },
                        child: const Text('Déconnection'),
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