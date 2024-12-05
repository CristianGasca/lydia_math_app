import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lydia_math_app/components/my_textfiled.dart';
class CalculateT extends StatelessWidget {
  final TextEditingController p0Controller = TextEditingController();
  final TextEditingController ptController = TextEditingController();
  final TextEditingController rController = TextEditingController();

  CalculateT({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calcular Tiempo', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Ingrese los parametros: ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
            const SizedBox(height: 10),
            MyTextField(
              controller: p0Controller,
              hintText: 'Población inicial', obscureText: false,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: ptController,
              hintText:'Población final', obscureText: false,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: rController,
              hintText: 'Tasa de crecimiento', obscureText: false,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
              onPressed: () {
                double p0 = double.parse(p0Controller.text);
                double pt = double.parse(ptController.text);
                double r = double.parse(rController.text);

                // Fórmula: t = ln(P(t) / P0) / r
                double t = (log(pt / p0)) / r;

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Resultado'),
                    content: Text('Tiempo requerido: $t'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Continuar', style: TextStyle(color: Colors.orange),),
                      ),
                    ],
                  ),
                );
              },
              child:const  Text('Calcular'),
            ),
          ],
        ),
      ),
    );
  }
}