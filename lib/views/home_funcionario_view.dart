import 'package:flutter/material.dart';

import '../cores.dart';
import '../viewmodels/home_funcionario_viewmodel.dart';
import '../widgets/categoria_card.dart';
import '../widgets/home_header.dart';

class HomeFuncionarioView extends StatefulWidget {
  const HomeFuncionarioView({super.key});

  @override
  State<HomeFuncionarioView> createState() => _HomeFuncionarioViewState();
}

class _HomeFuncionarioViewState extends State<HomeFuncionarioView> {
  final _vm = HomeFuncionarioViewModel();

  @override
  void dispose() {
    _vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Redesenha a tela sempre que o ViewModel avisar que mudou algo
    return ListenableBuilder(
      listenable: _vm,
      builder: (context, _) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                HomeHeader(
                  saudacao: _vm.saudacao,
                  nome: _vm.usuario.nome,
                  fotoUrl: _vm.usuario.fotoUrl,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        const Text(
                          'Categorias',
                          style: TextStyle(fontSize: 18, color: Cores.azulTitulo),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CategoriaCard(
                              icone: Icons.warning_amber_rounded,
                              titulo: 'Avisos',
                              onTap: () {
                                // TODO: abrir tela de avisos
                              },
                            ),
                            CategoriaCard(
                              icone: Icons.medical_services_outlined,
                              titulo: 'Cadastrar\nProfissionais',
                              onTap: () {
                                // TODO: abrir tela de cadastro de profissionais
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _vm.abaAtual,
            onTap: _vm.selecionarAba,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Cores.azulDestaque,
            unselectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Perfil'),
            ],
          ),
        );
      },
    );
  }
}