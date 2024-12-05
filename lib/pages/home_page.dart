import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lydia_math_app/components/my_drawer.dart';
import '../components/calculate_p.dart';
import '../components/calculate_r.dart';
import '../components/calculate_t.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lydia Math'),
        centerTitle: true,
      ),
      drawer : MyDrawer(),
    
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/gifs/ecuacion.gif',),
            const Text(
              'Seleccione una opción:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
            .animate()
            .tint(color: Colors.green)
            .then()
            .shake(duration: .15.seconds)
            ,
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculateP()),
                );
              },
              icon: Image.asset('assets/gifs/ciudad-contaminada.gif', scale: 20,),
              label: const Text('Calcular Población', style: TextStyle(color: Colors.blue),),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculateT()),
                );
              },
              icon: Image.asset('assets/gifs/tiempo.gif', scale: 20,),
              label: const Text('Calcular Tiempo', style: TextStyle(color: Colors.blueAccent),),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculateR()),
                );
              },
              icon: Image.asset('assets/gifs/es.gif', scale: 20,),
              label: const Text('Calcular Constante', style: TextStyle(color: Colors.lightBlue),),
            ),
          ],
        ),
      ),
    );
  }
}