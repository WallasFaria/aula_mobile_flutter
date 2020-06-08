
import 'package:mobx/mobx.dart';

part 'contador.g.dart';

class Contador = _ContadorBase with _$Contador;

abstract class _ContadorBase with Store {
  @observable
  var valor = 0;

  @observable
  var loading = false;

  @action
  void almentar() {
    valor++;
  }

  @action
  void diminuir() => valor--;

  @computed
  String get positivoNegativo {
    return valor > 0 ? 'Positivo' : 'Negativo';
  }
}
