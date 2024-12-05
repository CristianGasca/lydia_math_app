import 'package:flutter/material.dart';
import 'package:lydia_math_app/pages/home_page.dart';
import 'package:lydia_math_app/pages/themes_page.dart';

class MyDrawer extends StatelessWidget {

  const MyDrawer({super.key});

  @override

  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // logo
          DrawerHeader(child: Center(
            child: Image.asset('assets/gifs/mantenimiento.gif'),
          ),),
          const Text('Lydia Math', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, 
          color: Colors.grey),),
          //home title
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25),
            child: ListTile(
              title: const Text('HOME'),
              leading: const Icon(Icons.home),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
              },
            ),
          ),
          //settings title
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0),
            child: ListTile(
              title: const Text('SETTINGS'),
              leading: const Icon(Icons.settings),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Temas(),));
              },
            ),
          )
        ],
      ),
    );
  }
}