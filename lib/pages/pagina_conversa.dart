import 'dart:math';

import 'package:flutter/material.dart';
import 'package:app_chat/components/conversa_mensagem.dart';
import 'package:app_chat/components/appbar_header.dart';
import 'package:app_chat/styles/fonts.dart';
import 'package:app_chat/styles/cores.dart';
import 'package:app_chat/utils/helpers.dart';
import 'package:app_chat/utils/validator.dart';

class PaginaConversa extends StatefulWidget {
  const PaginaConversa({
    super.key,
    // required this.idConversa,
  });

  // final String idConversa;

  @override
  State<PaginaConversa> createState() => _PaginaConversaState();
}

class _PaginaConversaState extends State<PaginaConversa> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mensagemController = TextEditingController();

  List<ConversaMensagem> listaMensagens = [];

  @override
  void dispose() {
    _mensagemController.dispose();
    super.dispose();
  }

  OutlineInputBorder colorFocusedBorderInput(Color color) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(16),
        topLeft: Radius.circular(16),
      ),
      borderSide: BorderSide(color: color, width: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      fontSize: 16,
      fontFamily: fontFamily,
      fontWeight: fontWeightRegular,
    );

    return Scaffold(
      appBar: const AppBarHeader(
        titulo: "Conversa",
        exibeBusca: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
              shrinkWrap: true,
              itemCount: listaMensagens.length,
              itemBuilder: (context, index) {
                ConversaMensagem item = listaMensagens[index];
                return item;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
            child: Form(
              key: _formKey,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 80,
                    child: TextFormField(
                      controller: _mensagemController,
                      keyboardType: TextInputType.text,
                      validator: validaCampoVazio,
                      decoration: InputDecoration(
                        hintText: "Mensagem",
                        hintStyle: textStyle,
                        errorStyle: textStyle,
                        border: colorFocusedBorderInput(preto),
                        focusedBorder: colorFocusedBorderInput(azul1),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            _mensagemController.clear();
                            _formKey.currentState!.reset();
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 64,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: azul1,
                        shape: const ContinuousRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            String mensagem = _mensagemController.text;
                            String nomeUsuario = "Usuario"; /* Arrumar */
                            String nomeContato = "Contato"; /* Arrumar */

                            listaMensagens.add(
                              ConversaMensagem(
                                mensagem: mensagem,
                                tipo: TipoConversaMensagem.usuario,
                                nome: nomeUsuario,
                                dataHora: geraDataHoraFormatada(),
                              ),
                            );
                            listaMensagens.add(ConversaMensagem(
                              mensagem: mensagensConversa[
                                  Random().nextInt(mensagem.length - 1)],
                              tipo: TipoConversaMensagem.contato,
                              nome: nomeContato,
                              dataHora: geraDataHoraFormatada(),
                            ));
                            _mensagemController.clear();
                            _formKey.currentState!.reset();
                          });
                        }
                      },
                      child: const Icon(
                        Icons.double_arrow,
                        color: branco,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> mensagensConversa = [
  "Bom dia!!",
  "Boa tarde!!",
  "Boa noite!!",
  "Legal!!",
  "Vou dar uma olhada.",
  "Obrigado.",
  "Adeus.",
  "Vou ir ai depois.",
  "Até amanhã.",
  "A hora é ${geraHoraFormatada()}",
  "A data de hoje é ${geraDataFormatada()}",
];

// String texto = "Lorem ipsum dolor sit amet consectetur adipisicing elit.";

// List<ConversaMensagem> listaMensagensTeste = [
//   ConversaMensagem(mensagem: texto, tipo: TipoConversaMensagem.usuario),
//   ConversaMensagem(mensagem: texto, tipo: TipoConversaMensagem.contato),
//   ConversaMensagem(mensagem: texto, tipo: TipoConversaMensagem.usuario),
//   ConversaMensagem(mensagem: texto, tipo: TipoConversaMensagem.contato),
//   ConversaMensagem(mensagem: texto, tipo: TipoConversaMensagem.usuario),
//   ConversaMensagem(mensagem: texto, tipo: TipoConversaMensagem.usuario),
//   ConversaMensagem(mensagem: texto, tipo: TipoConversaMensagem.contato),
//   ConversaMensagem(mensagem: texto, tipo: TipoConversaMensagem.contato),
//   ConversaMensagem(mensagem: texto, tipo: TipoConversaMensagem.contato),
//   ConversaMensagem(mensagem: texto, tipo: TipoConversaMensagem.usuario),
// ];
