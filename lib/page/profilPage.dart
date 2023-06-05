import 'package:flutter/material.dart';
import 'package:schood_android/global.dart';
import 'connexionPage.dart';
import 'homePage.dart';
import 'package:schood_android/request/get.dart';
import 'dart:convert';
import 'package:http/http.dart';

class profilPage extends StatefulWidget {
  @override
  State<profilPage> createState() => _profilState();
}

class _profilState extends State<profilPage> {

  String nameMsg = 'error';
  String firstNameMsg = 'error';
  String classMsg = 'error';
  var classe = [];

  changeText(name, firstName, classes) {

    setState(() {
      nameMsg = name;
      firstNameMsg = firstName;
      classMsg = classes;
    });
  }

  infoProfil() async {
    final getclass = Get_Class();
    Response reponse = await getclass.getData(globalToken, 'user/profile');
    final body = jsonDecode(reponse.body);
    if (reponse.statusCode==200) {
      classe = body['classes'];
      changeText(body['firstname'], body['lastname'], classe[0]);
    }
    else {
      changeText('error', 'error', 'error');
    }
  }

  @override
  void initState() {
    super.initState();
    infoProfil();
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
                      Text(
                        nameMsg
                      ),
                      Text(
                          firstNameMsg
                      ),
                      Text(
                          classMsg
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>connexionPage()));
                        },
                        child: const Text('Déconnection'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homePage()));
                        },
                        child: const Text('Home'),
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