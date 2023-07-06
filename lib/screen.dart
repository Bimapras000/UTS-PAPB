import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class flutteruts extends StatefulWidget {
  const flutteruts({Key? key}) : super(key: key);

  @override
  State<flutteruts> createState() => _flutteruts();
}

class _flutteruts extends State<flutteruts> {
  int angka = 1;

  void tekanAku() {
    setState(() {
      angka = (angka + 2) % 46;
      if (angka.isEven) {
        tekanAku(); // Jika angka baru yang ditambahkan adalah genap, panggil tekanAku() lagi untuk mendapatkan angka ganjil berikutnya.
      }
    });
  }

  bool isPrime(int number) {
    if (number <= 1) {
      return false;
    }
    if (number <= 3) {
      return true;
    }
    for (int i = 2; i <= sqrt(number); i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz 1 dan UTS PAPB',
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: tekanAku,
          child: Text('Ganjil'),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Bima Prasetiya (2010441080)'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Angka: $angka',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                  fontWeight:
                      isPrime(angka) ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              Text(
                'Adalah bilangan primer? ${isPrime(angka)}',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 244, 17, 210),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
