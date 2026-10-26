import 'package:flutter/material.dart';

import '../cores.dart';

/// Cabeçalho azul com foto, saudação, nome e sino de notificações.
class HomeHeader extends StatelessWidget {
  final String saudacao;
  final String nome;
  final String? fotoUrl;

  const HomeHeader({
    super.key,
    required this.saudacao,
    required this.nome,
    this.fotoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
      decoration: const BoxDecoration(
        color: Cores.azulHeader,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            backgroundImage: fotoUrl != null ? NetworkImage(fotoUrl!) : null,
            child: fotoUrl == null
                ? const Icon(Icons.person, color: Cores.azulHeader, size: 28)
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  saudacao,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  nome,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
          ),
          const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.notifications_none, color: Colors.white, size: 28),
              Text(
                'Notificações',
                style: TextStyle(color: Colors.white, fontSize: 8),
              ),
            ],
          ),
        ],
      ),
    );
  }
}