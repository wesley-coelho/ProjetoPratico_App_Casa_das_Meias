import 'package:flutter/material.dart';

class Produto {
  String foto;
  String titulo;
  String descricao;
  double preco;
  int qtdEstoque;
  int unidade = 1;

  //icones
  Icon iconeDecItem = Icon(Icons.delete_outline);

  Produto(this.foto, this.titulo, this.descricao, this.preco, this.qtdEstoque);

  vendaProduto(int quantidade, BuildContext context) {
    if (this.qtdEstoque - quantidade > 0)
      this.qtdEstoque -= quantidade;
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Quantidade insuficiente!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  imprimeProduto() {
    print("**********************\n");
    print("Produto: ${this.titulo}\n");
    print("Descrição: ${this.descricao}\n");
    print("Estoque: ${this.qtdEstoque}\n");
    print("Quantidade: ${this.unidade}\n");
    print("Preço: ${this.preco}\n");
    print("**********************\n\n");
  }
}
