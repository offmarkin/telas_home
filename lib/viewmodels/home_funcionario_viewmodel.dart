import 'package:flutter/foundation.dart';

import '../models/usuario.dart';

class HomeFuncionarioViewModel extends ChangeNotifier {
  // TODO: trocar pelos dados reais do usuário logado
  final Usuario usuario = const Usuario(nome: 'Amanda Marques');
  final String saudacao = 'Bem-vinda ao GASPO';

  int abaAtual = 0;

  void selecionarAba(int indice) {
    abaAtual = indice;
    notifyListeners();
  }
}