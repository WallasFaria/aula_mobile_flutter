
String nomeValidator(String value) {
  if (value.isEmpty) {
    return 'Deve ser preenchido';
  }

  if (value.length < 6) {
    return 'deve ter pelo menos 6 caracteres';
  }

  return null;
}