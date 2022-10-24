import 'package:flutter/material.dart';
import 'package:segundo_parcial/modelos/usuario.dart';
import 'package:segundo_parcial/pantallas/detalle_pantalla.dart';
import 'package:segundo_parcial/pantallas/login_pantalla.dart';

class ListaPantalla extends StatelessWidget {
  ListaPantalla({Key? key, required this.usuario}) : super(key: key);
  List<Usuario> usuario;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Hasbullas',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPantalla()))
                      },
                  icon: const Icon(Icons.logout))
            ],
          ),
        ),
        body: Column(
          children: [
            ...usuario.map((e) {
              var index = usuario.indexOf(e);
              var user = usuario[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetallePantalla(
                                  user: user,
                                ))),
                  },
                  child: ListTile(
                    leading: const Icon(Icons.circle),
                    title: Text(
                      user.nombre,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(user.habilidades,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
