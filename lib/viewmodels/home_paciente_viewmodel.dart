import 'package:flutter/foundation.dart';

import '../models/usuario.dart';

class HomePacienteViewModel extends ChangeNotifier {
  // TODO: trocar pelos dados reais do usuário logado
  final Usuario usuario = const Usuario(nome: 'José da Silva');
  final String saudacao = 'Bem-vindo ao GASPO';

  int abaAtual = 0;

  void selecionarAba(int indice) {
    abaAtual = indice;
    notifyListeners();
  }
}