import 'package:flutter/material.dart';
import 'connexionPage.dart';
import 'package:schood_android/request/post.dart';
import 'package:http/http.dart';
import 'dart:convert';

class forgotPasswordPage extends StatefulWidget {
  const forgotPasswordPage({super.key});

  @override
  State<forgotPasswordPage> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPasswordPage> {

  TextEditingController loginController = TextEditingController();

  String errorMsg = '';

  changeText(string) {

    setState(() {
      errorMsg = string;
    });
  }

  _forgetPassword(BuildContext context) async {
    var data={
      'email': loginController.text,
    };
    final postclass = Post_Class();
    Response reponse = await postclass.postData(context, data, 'user/forgottenPassword');
    final body = jsonDecode(reponse.body);
    if (reponse.statusCode==200) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return connexionPage();
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
                      Padding(padding: EdgeInsets.fromLTRB(15, 5, 15, 15),
                        child: TextField(
                          controller: loginController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'E-mail',
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _forgetPassword(context);
                        },
                        child: const Text('Retrouver mon mot de passe !'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>connexionPage()));
                        },
                        child: const Text('Pas besoin...'),
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