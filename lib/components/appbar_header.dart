import 'package:flutter/material.dart';
import 'package:app_chat/styles/cores.dart';
import 'package:app_chat/styles/fonts.dart';

enum ItemMenuEnum { pefil, busca, sair }

class AppBarHeader extends StatefulWidget implements PreferredSizeWidget {
  const AppBarHeader({
    super.key,
    required this.titulo,
    required this.exibeBusca,
  });

  final String titulo;
  final bool exibeBusca;

  @override
  State<AppBarHeader> createState() => _AppBarHeaderState();

  @override
  Size get preferredSize {
    return const Size.fromHeight(60);
  }
}

class _AppBarHeaderState extends State<AppBarHeader> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: azul1,
      iconTheme: const IconThemeData(color: branco),
      title: Text(
        widget.titulo,
        style: const TextStyle(
          color: branco,
          fontFamily: fontFamily,
        ),
      ),
    );
  }
}
