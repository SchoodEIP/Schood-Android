import 'package:flutter/material.dart';
import 'forgotPasswordPage.dart';
import 'homePage.dart';


class connexionPage extends StatefulWidget {
  const connexionPage({super.key});

  @override
  State<connexionPage> createState() => _connexionState();
}

class _connexionState extends State<connexionPage> {
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
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homePage()));
                      },
                      child: const Text('Connexion'),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>forgotPasswordPage()));
                      },
                      child: Text('mot de passe oublié ?'),
                    )
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