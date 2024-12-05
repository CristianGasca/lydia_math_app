import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lydia_math_app/components/my_textfiled.dart';

class CalculateR extends StatelessWidget {
  final p0Controller = TextEditingController();
  final ptController = TextEditingController();
  final tController = TextEditingController();

  CalculateR({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Constante de Crecimiento', style: TextStyle(
        fontWeight: FontWeight.bold, color: Colors.grey),)),
      body: Padding(
        padding:const  EdgeInsets.all(16.0),
        child: Column(
          children: [
           const Text('Ingrese los parametros:', style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18)
              ),
            const SizedBox(height: 10),

            MyTextField(
              controller: p0Controller,
              hintText: 'Población inical ',
              keyboardType: TextInputType.number, obscureText: false,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: ptController,
              hintText: 'Poblacion Final', obscureText: false,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: tController,
              hintText: 'Tiempo', obscureText: false,
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
                double t = double.parse(tController.text);

                // Fórmula: r = ln(P(t) / P0) / t
                double r = (log(pt / p0)) / t;

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Resultado'),
                    content: Text('Tasa de crecimiento: $r'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Continuar', style: TextStyle(color: Colors.orange),),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Calcular'),
            ),
          ],
        ),
      ),
    );
  }
}