import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // EVENT > DECREMENT and INCREMENT

  int count = 0;

  void decrement() {
    // Para sinalizar mudança de estado, usamos o SetState;
    setState(() {
      count -= 1;
    });
  }

  void increment() {
    setState(() {
      count += 1;
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/image.png'),
                fit: BoxFit.cover),
          ),
          child: Column(
            // Child só pode ser declarado uma única vez;
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isFull ? 'Lotado' : 'Pode entrar!',
                style: TextStyle(
                  fontSize: 26,
                  color: isFull ? Colors.red : Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  count.toString(),
                  style: TextStyle(
                    fontSize: 100,
                    color: isFull ? Colors.red : Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: isFull ? null : increment,
                    style: TextButton.styleFrom(
                        backgroundColor: isFull
                            ? Colors.white.withOpacity(0.2)
                            : Colors.white,
                        fixedSize: const Size(100, 100),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        )),
                    child: const Text(
                      'Entrou',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 64),
                  TextButton(
                    onPressed: isEmpty ? null : decrement,
                    style: TextButton.styleFrom(
                      backgroundColor: isEmpty
                          ? Colors.white.withOpacity(0.2)
                          : Colors.white,
                      fixedSize: const Size(100, 100),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Saiu',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
