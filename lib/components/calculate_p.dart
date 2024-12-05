import 'dart:math';
import 'package:flutter/material.dart';

import 'my_textfiled.dart';
class CalculateP extends StatelessWidget {
  final  p0Controller = TextEditingController();
  final  rController = TextEditingController();
  final  tController = TextEditingController();

  CalculateP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calcular Población', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Ingrese los Parametros:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: p0Controller,
              hintText: 'Población inicial', obscureText: false,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: rController,
              hintText: 'Tasa de crecimiento', obscureText: false,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: tController,
              hintText: 'Intervalo de tiempo', obscureText: false,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
              onPressed: () {
                double p0 = double.parse(p0Controller.text);
                double r = double.parse(rController.text);
                double t = double.parse(tController.text);

                double pt = p0 * exp(r * t);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Resultado'),
                    content: Text(
                      'Población futura: ${pt.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Continuar', style: TextStyle(color: Colors.orange),),
                      ),
                    ],
                  ),
                );
              },
              label: const Text('Calcular'),
            ),
          ],
        ),
      ),
    );
  }
}