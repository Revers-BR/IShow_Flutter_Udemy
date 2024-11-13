import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("imagens/fundo.png"),
                    fit: BoxFit.fill
                  )
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 10,
                      child: Image.asset("imagens/detalhe1.png")
                    ),
                    Positioned(
                      left: 50,
                      child: Image.asset("imagens/detalhe2.png")
                    )
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey!,
                          blurRadius: 15,
                          spreadRadius: 4
                        )
                      ]
                    ),
                    child: Column(children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Email"
                        ),
                      )
                    ],),
                  ),
                  SizedBox(height: 20),
                  //InkWell(),
                  SizedBox(height: 20),
                  Text("Esqueci minha senha!", style: TextStyle(
                    color: Color.fromRGBO(255, 100, 127, 1),
                    fontWeight: FontWeight.bold
                  ))
                ],),
              ),
            ],
          ),
        ),
      ),
    );
  }
}