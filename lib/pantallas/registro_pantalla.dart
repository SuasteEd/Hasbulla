import 'package:flutter/material.dart';
import 'package:segundo_parcial/modelos/usuario.dart';
import 'package:segundo_parcial/pantallas/login_pantalla.dart';

class RegistroPantalla extends StatefulWidget {
  const RegistroPantalla({Key? key}) : super(key: key);

  @override
  _RegistroPantallaState createState() => _RegistroPantallaState();
}

class _RegistroPantallaState extends State<RegistroPantalla> {
  TextEditingController usuario = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController password = TextEditingController();
  List<String> lst = ['Soltero', 'Casado'];
  List<String> habilidadesList = ["Java", "C#", "C++"];
  List<String> items = <String>['Licenciatura', 'Maestría', 'Doctorado'];
  int selection = -1;
  String estadoCivil = "";
  String habilidades = "";
  String escolaridad = "";
  String? estado;
  bool selectedJava = false;
  bool selectedC = false;
  bool selectedC_ = false;
  String? valueItem;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: (() => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPantalla()))),
              ),
              const Text('Hasbulla-Registro',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Nombre',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
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
                      controller: nombre,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Nombre'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Usuario',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
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
                      controller: usuario,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Usuario'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Contraseña',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
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
                      controller: password,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Contraseña'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Estado civil',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Soltero'),
                      Radio(
                        value: 'Soltero',
                        groupValue: estado,
                        onChanged: (value) {
                          setState(() {
                            estado = value.toString();
                            estadoCivil = estado!;
                          });
                        },
                      ),
                      const Text('Casado'),
                      Radio(
                        value: 'Casado',
                        groupValue: estado,
                        onChanged: (value) {
                          setState(() {});
                          estado = value.toString();
                          estadoCivil = value.toString();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Habilidades',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Java'),
                      Checkbox(
                        value: selectedJava,
                        onChanged: (bool? value) {
                          setState(() {
                            habilidades =
                                habilidades + habilidadesList[0] + ' ';
                            selectedJava = value!;
                          });
                        },
                      ),
                      const Text('C#'),
                      Checkbox(
                        value: selectedC,
                        onChanged: (bool? value) {
                          setState(() {
                            habilidades =
                                habilidades + habilidadesList[1] + ' ';
                            selectedC = value!;
                          });
                        },
                      ),
                      const Text('C++'),
                      Checkbox(
                        value: selectedC_,
                        onChanged: (bool? value) {
                          setState(() {
                            habilidades =
                                habilidades + habilidadesList[2] + ' ';
                            selectedC_ = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Escolaridad',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
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
                    child: DropdownButton(
                      underline: Container(
                        height: 60,
                        width: 60,
                        color: Colors.transparent,
                      ),
                      isExpanded: true,
                      value: valueItem,
                      hint: const Center(child: Text("Escolaridad")),
                      items: items
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          valueItem = value!;
                          escolaridad = valueItem!;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: () async {
                    if (await verify()) {
                      user.add(Usuario(
                          user.last.id + 1,
                          usuario.text,
                          nombre.text,
                          password.text,
                          estadoCivil,
                          escolaridad,
                          habilidades));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPantalla()));
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                      child: Text(
                        'Registrarse',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> verify() async {
    if (usuario.text == "" ||
        nombre.text == "" ||
        password.text == "" ||
        escolaridad == "" ||
        estadoCivil == "") {
      await showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Error en registro"),
                content: Text("Debe completar todos los datos"),
              ));
      return false;
    }
    if (user.where((element) => usuario.text == element.usuario).isNotEmpty) {
      await showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Error en registro"),
                content: Text("El usuario ya existe"),
              ));
      return false;
    }
    return true;
  }
}
