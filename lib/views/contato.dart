import 'package:app_multiplier/views/widget/appbar_mobcar.dart';
import 'package:flutter/material.dart';

class Contato extends StatelessWidget {

  const Contato({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppbarMobcar(),
           body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/blackBackground.jpg',
                  ))),
        ),
        Positioned(
          right: 20,
          left: 30,
          top: MediaQuery.of(context).size.height*.2,
          child: const Column(
            children: [
              CircleAvatar(radius: 70,
                backgroundImage:AssetImage('assets/images/eu.jpg',)),
                SizedBox(height: 30,),
              Text('Desenvolvedor: Cinthia Dutra',style: TextStyle(color: Colors.blue, fontSize: 16),),
                SizedBox(height: 10,),

              Text('Celular : (21)99900-5171',style: TextStyle(color: Colors.blue, fontSize: 16),),
                SizedBox(height: 10,),

              Text('Email: cinthiadutra@gmail.com',style: TextStyle(color: Colors.blue, fontSize: 16),),
            ],
          ),
        ),
        
      ]),
       );
  }
}