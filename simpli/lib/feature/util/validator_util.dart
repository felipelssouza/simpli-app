class ValidatorUtil {
  static String validarCampoTexto(String valor, String campo) {
    if (valor.isEmpty) return '$campo é obrigatório';
    return null;
  }

  static String validarCampoAlfabetico(String valor, String campo) {
    if (valor.isEmpty) return '$campo é obrigatório';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(valor))
      return 'Por favor, apenas caracteres alfabéticos.';
    return null;
  }

  static String validarEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Digite um e-mail válido';
    else
      return null;
  }
}
