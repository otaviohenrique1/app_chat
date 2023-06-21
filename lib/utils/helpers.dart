import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

MaskTextInputFormatter mascaraNumerica(String mascara) {
  final resultadoMascaraNumero = MaskTextInputFormatter(
    mask: mascara,
    filter: {"#": RegExp(r'[0-9]')},
  );
  return resultadoMascaraNumero;
}

String geraUuid() {
  Uuid uuid = const Uuid();
  String resultado = uuid.v4();
  return resultado;
}

String geraDataHoraFormatada() {
  return DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now());
}

String geraHoraFormatada() {
  return DateFormat('HH:mm:ss').format(DateTime.now());
}

String geraDataFormatada() {
  return DateFormat('dd/MM/yyyy').format(DateTime.now());
}

String formataSenha(String valor) {
  return valor.replaceAll(RegExp(r'.'), "*");
}
