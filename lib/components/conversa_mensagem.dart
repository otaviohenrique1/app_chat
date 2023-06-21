import 'package:flutter/material.dart';
import 'package:app_chat/components/titulo.dart';
import 'package:app_chat/styles/cores.dart';
import 'package:app_chat/styles/fonts.dart';

enum TipoConversaMensagem { contato, usuario }

class ConversaMensagem extends StatefulWidget {
  const ConversaMensagem({
    super.key,
    required this.nome,
    required this.mensagem,
    required this.dataHora,
    required this.tipo,
  });

  final String nome;
  final String mensagem;
  final String dataHora;
  final TipoConversaMensagem tipo;

  @override
  State<ConversaMensagem> createState() => _ConversaMensagemState();
}

class _ConversaMensagemState extends State<ConversaMensagem> {
  @override
  Widget build(BuildContext context) {
    bool validaUsuario = widget.tipo == TipoConversaMensagem.usuario;
    bool validaContato = widget.tipo == TipoConversaMensagem.contato;

    double contatoBorderRadius = (validaContato) ? 8 : 0;
    double usuarioBorderRadius = (validaUsuario) ? 8 : 0;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: (validaContato) ? true : false,
          child: ConversaMensagemAvatar(tipo: widget.tipo),
        ),
        Expanded(
          flex: 90,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              border: Border.all(
                  color: (validaUsuario) ? verde : laranja, width: 2),
              borderRadius: BorderRadius.only(
                bottomRight: const Radius.circular(8),
                bottomLeft: const Radius.circular(8),
                topRight: Radius.circular(contatoBorderRadius),
                topLeft: Radius.circular(usuarioBorderRadius),
              ),
              color: (validaUsuario) ? verdeClaro : amarelo,
            ),
            /* Arrumar caso receba imagem ou outros tipos de arquivos */
            child: Column(
              children: [
                Titulo(
                  alignment: Alignment.centerLeft,
                  color: preto,
                  fontSize: 14,
                  fontWeight: fontWeightBold,
                  titulo: widget.nome,
                ),
                Titulo(
                  alignment: Alignment.centerLeft,
                  color: preto,
                  fontSize: 16,
                  fontWeight: fontWeightRegular,
                  titulo: widget.mensagem,
                ),
                Titulo(
                  alignment: Alignment.centerRight,
                  color: preto,
                  fontSize: 14,
                  fontWeight: fontWeightBold,
                  titulo: widget.dataHora,
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: (validaUsuario) ? true : false,
          child: ConversaMensagemAvatar(tipo: widget.tipo),
        ),
      ],
    );
  }
}

class ConversaMensagemAvatar extends StatelessWidget {
  const ConversaMensagemAvatar({
    super.key,
    required this.tipo,
  });

  final TipoConversaMensagem tipo;

  @override
  Widget build(BuildContext context) {
    const TipoConversaMensagem tipoContato = TipoConversaMensagem.contato;
    const TipoConversaMensagem tipoUsuario = TipoConversaMensagem.usuario;

    bool validaContato = tipo == tipoContato;
    bool validaUsuario = tipo == tipoUsuario;

    double usuarioBorderRadius = (validaUsuario) ? 8 : 0;
    double contatoBorderRadius = (validaContato) ? 8 : 0;

    Color cor;

    switch (tipo) {
      case tipoContato:
        cor = laranja;
        break;
      case tipoUsuario:
        cor = verde;
        break;
      default:
        cor = branco;
    }

    return Expanded(
      flex: 10,
      child: Container(
        decoration: BoxDecoration(
          color: cor,
          border: Border.all(color: cor, width: 1),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(usuarioBorderRadius),
            topRight: Radius.circular(usuarioBorderRadius),
            bottomLeft: Radius.circular(contatoBorderRadius),
            topLeft: Radius.circular(contatoBorderRadius),
          ),
        ),
        width: double.infinity,
        height: 40,
        child: const Icon(Icons.account_circle),
      ),
    );
  }
}

/*
  class MensagemUsuario extends StatelessWidget {
    const MensagemUsuario({
      super.key,
      required this.texto,
    });

    final String texto;

    @override
    Widget build(BuildContext context) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 90,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: verde, width: 2),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                  color: verdeClaro,
                ),
                child: Text(texto),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                decoration: const BoxDecoration(
                  color: verde,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                width: double.infinity,
                height: 40,
                child: const Icon(Icons.account_circle),
              ),
            ),
          ],
        ),
      );
    }
  }
*/

/*
  class MensagemContato extends StatelessWidget {
    const MensagemContato({
      super.key,
      required this.texto,
    });

    final String texto;

    @override
    Widget build(BuildContext context) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 10,
              child: Container(
                decoration: const BoxDecoration(
                  color: laranja,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                ),
                width: double.infinity,
                height: 40,
                child: const Icon(Icons.account_circle),
              ),
            ),
            Expanded(
              flex: 90,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: laranja, width: 2),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  color: amarelo,
                ),
                child: Text(texto),
              ),
            ),
          ],
        ),
      );
    }
  }
*/

/*
  class ConversaMensagemAvatar extends StatelessWidget {
    const ConversaMensagemAvatar({
      super.key,
      required this.tipo,
      required this.visibilidadeAvatar,
      required this.corFundo,
    });

    final TipoConversaMensagem tipo;
    final bool visibilidadeAvatar;
    final Color corFundo;

    @override
    Widget build(BuildContext context) {
      bool validaContato = tipo == TipoConversaMensagem.contato;
      bool validaUsuario = tipo == TipoConversaMensagem.usuario;

      double usuarioBorderRadius = (validaUsuario) ? 8 : 0;
      double contatoBorderRadius = (validaContato) ? 8 : 0;

      return Visibility(
        visible: visibilidadeAvatar,
        child: Expanded(
          flex: 10,
          child: Container(
            decoration: BoxDecoration(
              color: corFundo,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(contatoBorderRadius),
                topRight: Radius.circular(contatoBorderRadius),
                bottomLeft: Radius.circular(usuarioBorderRadius),
                topLeft: Radius.circular(usuarioBorderRadius),
              ),
            ),
            width: double.infinity,
            height: 40,
            child: const Icon(Icons.account_circle),
          ),
        ),
      );
    }
  }
*/

/*
  Row(
    children: [
      Expanded(
        flex: 15, // Define a proporção do primeiro Container (15%)
        child: Container(
          color: Colors.blue,
          width: double.infinity,
          height: 100,
        ),
      ),
      Expanded(
        flex: 85, // Define a proporção do segundo Container (85%)
        child: Container(
          color: Colors.red,
          width: double.infinity,
          height: 100,
        ),
      ),
    ],
  ),
*/
