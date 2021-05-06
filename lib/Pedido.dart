class Pedido {
  static int codPedido = 0;
  DateTime dataHora = DateTime.now();
  double valor;
  var produto = [];
  //Dados do Usuario
  Object usuario;

  //Status pedido
  String status = "Em andamento"; //Em andamento / finalizado / cancelado
  Pedido() {
    codPedido += 1;
  }
}
