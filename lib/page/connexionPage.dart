import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'forgotPasswordPage.dart';
import 'homePage.dart';
import 'package:schood_android/request/post.dart';
import 'dart:convert';
import '../global.dart' as global;

class connexionPage extends StatefulWidget {
  const connexionPage({super.key});

  @override
  State<connexionPage> createState() => _connexionState();
}

class _connexionState extends State<connexionPage> {

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String errorMsg = '';

      changeText(string) {

        setState(() {
          errorMsg = string;
        });
      }

  _login(BuildContext context) async {
    var data={
      'email': loginController.text,
      'password': passwordController.text,
    };
    final postclass = Post_Class();
    Response reponse = await postclass.postData(context, data, 'user/login');
    final body = jsonDecode(reponse.body);
    if (reponse.statusCode==200) {
      global.globalToken = body['token'];
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return homePage();
      }));
    }
    else {
        changeText(body['message']);
        }
      }

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
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 5), //apply padding to all four sides
                      child: TextField(
                        controller: loginController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'E-mail',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 15), //apply padding to all four sides
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _login(context);
                      },
                      child: const Text('Connexion'),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>forgotPasswordPage()));
                      },
                      child: Text('mot de passe oublié ?'),
                    ),
                    Text(
                        errorMsg,
                      style: TextStyle(color: Colors.red),
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