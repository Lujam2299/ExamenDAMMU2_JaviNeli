import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juego de la Colmena',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Juego de la Colmena'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Random _random = Random();
  int id=0;
  int _generateRandomValue() {
    double randomNumber = _random.nextDouble();
    if (randomNumber < 0.7) {
      return 1;
    } else if (randomNumber < 0.85) {
      return 2;
    } else if (randomNumber < 0.95) {
      return 3;
    } else {
      return 4;
    }
  }
  int winner=0;
  int vidas=7;
  double size = 250;

  BoxDecoration cajaRedonda(Color fondo) => BoxDecoration(
      color: fondo,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
          color: Colors.black.withOpacity(0.8),
          width: 5,
          ),
      );
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  id++;
                  int randomNumber;
                  if (index == 4) {
                    randomNumber = Random().nextInt(10) == 0 ? 4 : Random().nextInt(3) + 1;
                  } else {
                    randomNumber = Random().nextInt(3) + 1;
                  }

                  return Container(
                    width: size / 3,
                    height: size / 3,
                    decoration: cajaRedonda(Colors.yellow),
                    child: OutlinedButton(
                      onPressed: () {
                        int value= _generateRandomValue();
                        if(value==1){
                          vidas-=1;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Encontraste una abeja obrera"),
                                content: Text("Te quedan $vidas vidas"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }else if(value==2){
                          vidas=vidas;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Encontraste una larva"),
                                content: Text("Te quedan $vidas vidas"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }else if(value==3){
                          vidas-=2;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Encontraste un zángano"),
                                content: Text("Te quedan $vidas vidas"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }else{
                          winner=1;
                        }
                        if (winner==1) {
                          winner = 1;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("¡Ganaste!"),
                                content: Text("¡Felicidades, encontraste a la abeja reina!"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }else if(vidas<=0){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("¡Perdiste!"),
                                content: Text("¡Intenta en otra ocasión!"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }

                      },
                      child:  const Text(""),
                      //child: Text(randomNumber != 4 ? randomNumber.toString() : ""),
                    ),
                  );
                }),
              ),
              Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  id++;
                  int randomNumber;
                  if (index == 4) {
                    randomNumber = Random().nextInt(10) == 0 ? 4 : Random().nextInt(3) + 1;
                  } else {
                    randomNumber = Random().nextInt(3) + 1;
                  }

                  return Container(
                    width: size / 3,
                    height: size / 3,
                    decoration: cajaRedonda(Colors.yellow),
                    child: OutlinedButton(
                      onPressed: () {
                        int value= _generateRandomValue();
                        if(value==1){
                          vidas-=1;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Encontraste una abeja obrera"),
                                content: Text("Te quedan $vidas vidas"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }else if(value==2){
                          vidas=vidas;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Encontraste una larva"),
                                content: Text("Te quedan $vidas vidas"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }else if(value==3){
                          vidas-=2;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Encontraste un zángano"),
                                content: Text("Te quedan $vidas vidas"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }else{
                          winner=1;
                        }
                        if (winner==1) {
                          winner = 1;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("¡Ganaste!"),
                                content: Text("¡Felicidades, encontraste a la abeja reina!"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }else if(vidas<=0){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("¡Perdiste!"),
                                content: Text("¡Intenta en otra ocasión!"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }

                      },
                      child:  const Text(""),
                      //child: Text(randomNumber != 4 ? randomNumber.toString() : ""),
                    ),
                  );
                }),
              ),
              Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  id++;
                  int randomNumber;
                  if (index == 4) {
                    randomNumber = Random().nextInt(10) == 0 ? 4 : Random().nextInt(3) + 1;
                  } else {
                    randomNumber = Random().nextInt(3) + 1;
                  }

                  return Container(
                    width: size / 3,
                    height: size / 3,
                    decoration: cajaRedonda(Colors.yellow),
                    child: OutlinedButton(
                      onPressed: () {
                        int value= _generateRandomValue();
                        if(value==1){
                          vidas-=1;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Encontraste una abeja obrera"),
                                content: Text("Te quedan $vidas vidas"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }else if(value==2){
                          vidas=vidas;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Encontraste una larva"),
                                content: Text("Te quedan $vidas vidas"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }else if(value==3){
                          vidas-=2;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Encontraste un zángano"),
                                content: Text("Te quedan $vidas vidas"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }else{
                          winner=1;
                        }
                        if (winner==1) {
                          winner = 1;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("¡Ganaste!"),
                                content: Text("¡Felicidades, encontraste a la abeja reina!"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }else if(vidas<=0){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("¡Perdiste!"),
                                content: Text("¡Intenta en otra ocasión!"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }

                      },
                      child:  const Text(""),
                      //child: Text(randomNumber != 4 ? randomNumber.toString() : ""),
                    ),
                  );
                }),
              ),Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  id++;
                  int randomNumber;
                  if (index == 4) {
                    randomNumber = Random().nextInt(10) == 0 ? 4 : Random().nextInt(3) + 1;
                  } else {
                    randomNumber = Random().nextInt(3) + 1;
                  }

                  return Container(
                    width: size / 3,
                    height: size / 3,
                    decoration: cajaRedonda(Colors.yellow),
                    child: OutlinedButton(
                      onPressed: () {
                        int value= _generateRandomValue();
                        if(value==1){
                          vidas-=1;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Encontraste una abeja obrera"),
                                content: Text("Te quedan $vidas vidas"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }else if(value==2){
                          vidas=vidas;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Encontraste una larva"),
                                content: Text("Te quedan $vidas vidas"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }else if(value==3){
                          vidas-=2;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Encontraste un zángano"),
                                content: Text("Te quedan $vidas vidas."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }else{
                          winner=1;
                        }
                        if (winner==1) {
                          winner = 1;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("¡Ganaste!"),
                                content: Text("¡Felicidades, encontraste a la abeja reina!"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }else if(vidas<=0){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("¡Perdiste!"),
                                content: Text("¡Intenta en otra ocasión!"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }

                      },
                      child:  const Text(""),
                      //child: Text(randomNumber != 4 ? randomNumber.toString() : ""),
                    ),
                  );
                }),
              ),Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  id++;
                  int randomNumber;
                  if (index == 4) {
                    randomNumber = Random().nextInt(10) == 0 ? 4 : Random().nextInt(3) + 1;
                  } else {
                    randomNumber = Random().nextInt(3) + 1;
                  }

                  return Container(
                    width: size / 3,
                    height: size / 3,
                    decoration: cajaRedonda(Colors.yellow),
                    child: OutlinedButton(
                      onPressed: () {
                        int value= _generateRandomValue();
                        if(value==1){
                          vidas-=1;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Encontraste una abeja obrera"),
                                content: Text("Te quedan $vidas vidas"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }else if(value==2){
                          vidas=vidas;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Encontraste una larva"),
                                content: Text("Te quedan $vidas vidas"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }else if(value==3){
                          vidas-=2;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Encontraste un zángano"),
                                content: Text("Te quedan $vidas vidas"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }else{
                          winner=1;
                        }
                        if (winner==1) {
                          winner = 1;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("¡Ganaste!"),
                                content: Text("¡Felicidades, encontraste a la abeja reina!"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }else if(vidas<=0){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("¡Perdiste!"),
                                content: Text("¡Intenta en otra ocasión!"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                ],
                              );
                            },
                          );
                        }

                      },
                      child:  const Text(""),
                      //child: Text(randomNumber != 4 ? randomNumber.toString() : ""),
                    ),
                  );
                }),
              ),
            ],
          ),
          ),
    );
  }
}
