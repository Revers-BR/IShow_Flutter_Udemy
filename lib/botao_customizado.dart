import 'package:flutter/material.dart';

class BotaoCustomizado extends StatelessWidget {

  final AnimationController animationController;

  final Animation<double> largura;
  final Animation<double> altura;
  final Animation<double> opacidade;
  final Animation<double> radius;

  BotaoCustomizado({super.key, required this.animationController}):
    largura = Tween<double>(
      begin: 0, end: 500
    ).animate(CurvedAnimation(
      parent: animationController, 
      curve: const Interval(0.5, 1)
    )),

    altura = Tween<double>(
      begin: 0, end: 50
    ).animate(CurvedAnimation(
      parent: animationController, 
      curve: const Interval(0.5, .7)
    )),

    opacidade = Tween<double>(
      begin: 0, end: 1
    ).animate(CurvedAnimation(
      parent: animationController, 
      curve: const Interval(0.6, 0.8)
    )),

    radius = Tween<double>(
      begin: 0, end: 20
    ).animate(CurvedAnimation(
      parent: animationController, 
      curve: const Interval(0.6, 1)
    ))
  ;

  Widget _builder(BuildContext context, Widget? child){
    return InkWell(
      onTap: () {
        
      },
      child: Container(
        height: altura.value,
        width: largura.value,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius.value),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(255, 100, 127, 1),
            Color.fromRGBO(255, 123, 145, 1)
          ])
        ),
        child: Center(
          child: FadeTransition(
            opacity: opacidade,
            child: const Text("Entrar", style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            )),
          ) 
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController, 
      builder: _builder
    );
  }
}