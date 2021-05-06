import 'dart:ui';
import 'main.dart';

import 'package:flutter/material.dart';
import 'Produto.dart';

// ignore: must_be_immutable
class Cartao extends StatefulWidget {
  String titulo;
  String descricao;
  double preco;
  String foto;
  Produto produto;

  Cartao(Produto produto) {
    this.titulo = produto.titulo;
    this.descricao = produto.descricao;
    this.preco = produto.preco;
    this.foto = produto.foto;
    this.produto = produto;
  }

  @override
  _CartaoState createState() => _CartaoState();
}

class _CartaoState extends State<Cartao> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 10.0, left: 30.0, right: 30.0, bottom: 10.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          /* gradient: LinearGradient(
            colors: [
              Color.fromRGBO(242, 202, 82, 1),
              Color.fromRGBO(255, 255, 255, 0.5)
            ],
          ), */
          borderRadius: BorderRadiusDirectional.all(Radius.circular(10.0)),
          // color: Color.fromRGBO(242, 167, 75, 0.05),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  widget.foto,
                  width: 120,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Cor: '),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(
                          top: 5.0, left: 2.0, right: 2.0, bottom: 5.0),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(
                          top: 5.0, left: 2.0, right: 2.0, bottom: 5.0),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.zero,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.titulo,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        widget.descricao,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        widget.preco.toStringAsPrecision(4),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                        icon: Icon(Icons.local_grocery_store),
                        onPressed: () {
                          setState(() {
                            listaCarrinho.add(widget.produto);
                            Navigator.pushNamed(context, '/MenuPrincipal');
                          });
                        },
                        label: Text('Adicionar'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
