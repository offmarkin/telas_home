import 'package:flutter/material.dart';

import '../cores.dart';

/// Card quadrado com relevo. Fica azul enquanto é pressionado.
class CategoriaCard extends StatefulWidget {
  final IconData icone;
  final String titulo;
  final VoidCallback onTap;

  const CategoriaCard({
    super.key,
    required this.icone,
    required this.titulo,
    required this.onTap,
  });

  @override
  State<CategoriaCard> createState() => _CategoriaCardState();
}

class _CategoriaCardState extends State<CategoriaCard> {
  bool _pressionado = false;

  @override
  Widget build(BuildContext context) {
    final corFundo = _pressionado ? Cores.azulDestaque : Colors.white;
    final corIcone = _pressionado ? Colors.white : Cores.azulDestaque;
    final corTexto = _pressionado ? Colors.white : Colors.grey.shade600;

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressionado = true),
      onTapUp: (_) => setState(() => _pressionado = false),
      onTapCancel: () => setState(() => _pressionado = false),
      onTap: widget.onTap,
      child: Container(
        width: 110,
        height: 110,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Cores.cardFundo,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(color: Colors.white, offset: Offset(-4, -4), blurRadius: 8),
            BoxShadow(color: Color(0x33000000), offset: Offset(4, 4), blurRadius: 8),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: corFundo,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icone, size: 40, color: corIcone),
              const SizedBox(height: 6),
              Text(
                widget.titulo,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11, color: corTexto),
              ),
            ],
          ),
        ),
      ),
    );
  }
}