import 'package:cocktelia/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});
  //Método para asignar duración y ruta a tomar por la splashScreen
  @override
  Widget build(BuildContext context) {
        var seconds = const Duration(seconds: 3);
    Future.delayed(seconds, (){
      Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context)=> const MyHomePage()), 
        (route) => false);
  },);
    return Scaffold(
      body: Stack(
        children: [
          //Imagen de fondo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/OIG3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //Texto de presentación
          const Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Text('CocktElia',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 250, 237, 223),
                fontFamily: "Bahianita-Regular",
                fontSize: 48,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
