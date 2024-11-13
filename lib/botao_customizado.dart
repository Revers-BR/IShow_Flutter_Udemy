import 'package:flutter/material.dart';

class BotaoCustomizado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(255, 100, 127, 1),
            Color.fromRGBO(255, 123, 145, 1)
          ])
        ),
        child: const Center(
          child: Text("Entrar", style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          )),
        ),
      )
    );
  }
}