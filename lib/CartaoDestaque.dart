import 'package:flutter/material.dart';
import 'Produto.dart';

// ignore: must_be_immutable
class CartaoDestaque extends StatefulWidget {
  String foto;
  String titulo;
  String descricao;
  double preco;
  CartaoDestaque(Produto produto) {
    this.foto = produto.foto;
    this.titulo = produto.titulo;
    this.descricao = produto.descricao;
    this.preco = produto.preco;
  }

  @override
  _CartaoDestaqueState createState() => _CartaoDestaqueState();
}

class _CartaoDestaqueState extends State<CartaoDestaque> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,

      margin: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 10.0, right: 10.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white, //Color.fromRGBO(35, 183, 217, 0.5),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      //linha com as informações do produto
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //foto do produto
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.foto,
                width: 60,
              ),
              SizedBox(
                height: 5,
              ),
              //linha com info de cor
              Row(
                children: [
                  Text(
                    'Cor: ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    textAlign: TextAlign.left,
                  ),
                  //Cor: circulo preto
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),

                  //Cor circulo Branco
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // info do produto
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //cabeçalho
              Text(
                widget.titulo,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                textAlign: TextAlign.end,
              ),

              //descrição produto
              Text(
                widget.descricao,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                ),
                textAlign: TextAlign.end,
              ),

              //Preço produto
              Text(
                "R\$ " + widget.preco.toStringAsPrecision(4),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
