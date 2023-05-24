import 'package:flutter/material.dart';
import 'connexionPage.dart';

class forgotPasswordPage extends StatefulWidget {
  const forgotPasswordPage({super.key});

  @override
  State<forgotPasswordPage> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPasswordPage> {
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
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Login',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>connexionPage()));
                        },
                        child: const Text('Retrouver mon mot de passe !'),
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