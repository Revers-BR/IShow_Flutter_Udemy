import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ishow_flutter_udemy/botao_customizado.dart';
import 'package:ishow_flutter_udemy/input_customizado.dart';

class Login extends StatefulWidget {
  
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> with SingleTickerProviderStateMixin{

  AnimationController? _controller;

  Animation? _animationBlur;
  Animation? _animationFade;
  Animation? _animationSize;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this
    );

    _animationBlur = Tween<double>(
      begin: 10, end: 0
    ).animate(
      CurvedAnimation(
        parent: _controller!, 
        curve: Curves.ease
      )
    );

    _animationFade = Tween<double>(
      begin: 0, end: 1
    ).animate(
      CurvedAnimation(
        parent: _controller!, 
        curve: Curves.easeInOutQuint
      )
    );

    _animationSize = Tween<double>(
      begin: 0, end: 500
    ).animate(
      CurvedAnimation(
        parent: _controller!, 
        curve: Curves.decelerate
      )
    );

    _controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedBuilder(
              animation: _animationBlur!, 
              builder: (context, child) {
                return Container(
                  height: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("imagens/fundo.png"),
                      fit: BoxFit.fill
                    )
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: _animationBlur!.value,
                      sigmaY: _animationBlur!.value
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 10,
                          child: FadeTransition(
                            opacity: _animationFade as Animation<double>,
                            child: Image.asset("imagens/detalhe1.png"),
                          )
                        ),
                        Positioned(
                          left: 50,
                          child: FadeTransition(
                            opacity: _animationFade as Animation<double>,
                            child: Image.asset("imagens/detalhe2.png"),
                          )
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
      
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(children: [
                AnimatedBuilder(
                  animation: _animationSize!, 
                  builder: (context, child) {
                    return Container(
                      width: _animationSize!.value,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[200]!,
                            blurRadius: 15,
                            spreadRadius: 4
                          )
                        ]
                      ),
                      child: const Column(children: [
                        InputCustomizado(
                          hintText: "Email",
                        ),
                        InputCustomizado(
                          hintText: "Senha",
                          obscureText: true,
                          icon: Icon(Icons.lock),
                        ),
                      ]),
                    );
                  },
                ),
                const SizedBox(height: 20),
                BotaoCustomizado(animationController: _controller!,),
                const SizedBox(height: 20),
                FadeTransition(
                  opacity: _animationFade as Animation<double>,
                  child: const Text("Esqueci minha senha!", style: TextStyle(
                    color: Color.fromRGBO(255, 100, 127, 1),
                    fontWeight: FontWeight.bold
                  )),
                )
              ],),
            ),
          ],
        ),
      ),
    );
  }
}