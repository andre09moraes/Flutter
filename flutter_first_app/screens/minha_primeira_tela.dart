import 'package:flutter/material.dart';

class MyFirstWidget extends StatelessWidget {
  const MyFirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                color: Colors.amber,
                width: 200,
                height: 200,
              ),
              Container(
                color: Colors.white,
                width: 100,
                height: 100,
              ),
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                color: Colors.white,
                width: 200,
                height: 200,
              ),
              Container(
                color: Colors.amber,
                width: 100,
                height: 100,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.blue,
                width: 100,
                height: 50,
              ),
              Container(
                color: Colors.pink,
                width: 100,
                height: 50,
              ),
              Container(
                color: Colors.deepPurple,
                width: 100,
                height: 50,
              )
            ],
          ),
          Container(
            color: const Color.fromARGB(100, 250, 2, 10),
            height: 30,
            width: 300,
            child: const Text(
              'Primeiro texto',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                decoration: TextDecoration.none,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                // print('Você apertou o botão');
              },
              child: const Text('Aperte o botão!')
          )
        ],
      ),
    );
  }
}
