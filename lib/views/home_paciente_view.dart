import 'package:flutter/material.dart';

import '../cores.dart';
import '../viewmodels/home_paciente_viewmodel.dart';
import '../widgets/categoria_card.dart';
import '../widgets/home_header.dart';

class HomePacienteView extends StatefulWidget {
  const HomePacienteView({super.key});

  @override
  State<HomePacienteView> createState() => _HomePacienteViewState();
}

class _HomePacienteViewState extends State<HomePacienteView> {
  final _vm = HomePacienteViewModel();

  @override
  void dispose() {
    _vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        const SizedBox(height: 24),
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 32,
                            crossAxisSpacing: 16,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              CategoriaCard(
                                icone: Icons.medical_information_outlined,
                                titulo: 'Especialistas',
                                onTap: () {
                                  // TODO: abrir tela de especialistas
                                },
                              ),
                              CategoriaCard(
                                icone: Icons.chat_bubble_outline,
                                titulo: 'Comunicados',
                                onTap: () {
                                  // TODO: abrir tela de comunicados
                                },
                              ),
                              CategoriaCard(
                                icone: Icons.check_circle_outline,
                                titulo: 'Avaliação',
                                onTap: () {
                                  // TODO: abrir tela de avaliação
                                },
                              ),
                              CategoriaCard(
                                icone: Icons.local_hospital_outlined,
                                titulo: 'Localização',
                                onTap: () {
                                  // TODO: abrir tela de localização
                                },
                              ),
                            ],
                          ),
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
              BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Agendar'),
              BottomNavigationBarItem(icon: Icon(Icons.description_outlined), label: 'Histórico'),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Perfil'),
            ],
          ),
        );
      },
    );
  }
}