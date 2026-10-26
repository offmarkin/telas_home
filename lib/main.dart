import 'package:flutter/material.dart';

import 'cores.dart';
import 'views/home_funcionario_view.dart';
import 'views/home_paciente_view.dart';

void main() => runApp(const GaspoApp());

class GaspoApp extends StatelessWidget {
  const GaspoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GASPO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Cores.fundo,
        colorScheme: ColorScheme.fromSeed(seedColor: Cores.azulHeader),
      ),
      home: const EscolhaPerfil(),
    );
  }
}

/// TEMPORÁRIA: só para testar. Troque pela tela de login.
class EscolhaPerfil extends StatelessWidget {
  const EscolhaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomeFuncionarioView()),
              ),
              child: const Text('Entrar como Funcionário'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomePacienteView()),
              ),
              child: const Text('Entrar como Paciente'),
            ),
          ],
        ),
      ),
    );
  }
}