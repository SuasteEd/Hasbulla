import 'package:flutter/material.dart';
import 'package:segundo_parcial/modelos/usuario.dart';
import 'package:segundo_parcial/pantallas/lista_pantalla.dart';
import 'package:segundo_parcial/pantallas/registro_pantalla.dart';

List<Usuario> user = [
  Usuario(1, 'Fercho', 'Fernando', '12345', 'Soltero', 'Licenciatura', 'Java'),
  Usuario(2, 'Fercho1', 'Fernando', '12345', 'Soltero', 'Licenciatura', 'Java')
];

class LoginPantalla extends StatelessWidget {
  LoginPantalla({Key? key}) : super(key: key);

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int id = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[100],
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 200,
                  child: Image.asset('assets/hass.jpeg'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Hola Hasbullover!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
              const SizedBox(height: 10),
              const Text(
                'Bienvenido de nuevo, Hasbulla te extrañó :(',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: userController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Usuario'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Contraseña'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: () {
                    if (login(context)) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ListaPantalla(usuario: user)),
                          (route) => false);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                      child: Text(
                        'Iniciar sesión',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '¿Cómo que no tienes una cuenta?  ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: (() => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistroPantalla()))),
                    child: const Text('Registrate',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }

  bool login(context) {
    var us = userController.text;
    var pass = passwordController.text;
    var userLog = user.where((element) => element.usuario == us).toList();
    if (userLog.isNotEmpty) {
      var users = userLog[0];
      if (users.password == pass) {
        return true;
      }
    }
    if (userController.text.isEmpty || passwordController.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text('Campos vacíos'),
                content: Text('Llene todos los campos'),
              ));
      return false;
    }
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Incorrecto'),
              content: Text('Usuario o contraseña incorrectos'),
            ));
    return false;
  }
}
