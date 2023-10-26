import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primeiro_projeto/data/task_dao.dart';
import 'package:primeiro_projeto/data/task_inherited.dart';
import 'package:primeiro_projeto/screens/form_screen.dart';

import '../components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  double level = 0;
  double progress = 0;

  void refreshGeneralLevel() {
    setState(() {
      level = 0;
      progress = 0;
      for (var task in TaskInherited.of(context).taskList) {
        level += (task.nivel * task.dificuldade) / 10;
      }
      progress = level / 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          IconButton(onPressed: (){setState((){});}, icon: Icon(Icons.refresh))
        ],
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Tarefas',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 70, 8, 8),
              child: SizedBox(
                width: 170,
                child: LinearProgressIndicator(
                  color: Colors.red,
                  value: progress,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 50, 0, 80),
              child: Text(
                textAlign: TextAlign.left,
                'Level: $level',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 15, 0),
              child: SizedBox(
                height: 25,
                width: 25,
                child: IconButton(
                  onPressed: () {
                    refreshGeneralLevel();
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 80),
        child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(),
            builder: (context, snapShot) {
              List<Task>? items = snapShot.data;
              switch (snapShot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text("Carregando")
                      ],
                    ),
                  );
                  break;
                case ConnectionState.waiting:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text("Carregando")
                      ],
                    ),
                  );
                  break;
                case ConnectionState.active:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text("Carregando")
                      ],
                    ),
                  );
                  break;
                case ConnectionState.done:
                  if (snapShot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Task tarefa = items[index];
                            return tarefa;
                          });
                    }
                    return const Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 128,
                          ),
                          Text(
                            "Não há nenhuma tarefa",
                            style: TextStyle(fontSize: 32),
                          )
                        ],
                      ),
                    );
                  }
                  return const Text("Erro ao carregar tarefas ");
                  break;
              }
              return const Text("Erro");
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          ).then((value) => setState(() {
                print('Recarrendo a tela incial');
              }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
