import 'package:flutter/material.dart';
import 'Pedido.dart';
import 'main.dart';

//var pedido = new Pedido();
//
int quantidadeItem = 1;

class TelaPagamentoPedido extends StatefulWidget {
  @override
  _TelaPagamentoPedidoState createState() => _TelaPagamentoPedidoState();
}

class _TelaPagamentoPedidoState extends State<TelaPagamentoPedido> {
  //variaveis
  //

  int _currentIndex = 2;
  IconData iconeLogin = Icons.login;
  Icon _iconInicio = Icon(Icons.home_filled);
  Icon _iconProduto = Icon(Icons.list);
  Icon _iconCarrinho = Icon(Icons.local_grocery_store);
  Icon _iconConta = Icon(Icons.account_circle_outlined);
  TextEditingController _nomeTitular = TextEditingController();
  TextEditingController cep = TextEditingController();
  Icon iconeDeleteDiminuiItem = Icon(Icons.delete_outline);
  String radioBotaoSelecionado = "";
  var selectedRadio;
  double valorFrete = 0.0;
  Color corTextoFrete = Colors.grey[200];
  var itemEscolhido;
  var _parcelas = [
    "1 parcela",
    "2 parcelas",
    "3 parcelas",
    "4 parcelas",
    "5 parcelas"
  ];

  @override
  Widget build(BuildContext context) {
    Pedido pedidoRealizado = ModalRoute.of(context).settings.arguments;
    double subtotal = 0.0;

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Pagamento'), actions: []),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20.0, left: 20.0),
                    width: double.infinity,
                    child: Text(
                      'Cartão de crédito',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: 35,
                          margin: EdgeInsets.only(
                              left: 20.0, top: 20.0, right: 20.0),
                          alignment: Alignment.centerLeft,
                          child: TextFormField(
                            controller: _nomeTitular,
                            decoration: InputDecoration(
                              labelText: 'Nome do titular',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 300,
                        height: 35,
                        margin: EdgeInsets.only(left: 20.0, top: 10.0),
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Número do cartão',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Image.asset(
                        'images/bandeirasCartaoCredito.png',
                        height: 40,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        height: 35,
                        margin: EdgeInsets.only(left: 20.0, top: 10.0),
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Vencimento do cartão',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 35,
                        margin: EdgeInsets.only(left: 20.0, top: 10.0),
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Código cartão',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20.0, top: 5.0),
                        child: DropdownButton<String>(
                          hint: Text('Parcelamento'),
                          value: itemEscolhido,
                          onChanged: (String itemClicado) {
                            setState(() {
                              this.itemEscolhido = itemClicado;
                            });
                          },
                          items: _parcelas.map((String parcela) {
                            return DropdownMenuItem<String>(
                              value: parcela,
                              child: Text(parcela),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 150,
                        padding:
                            EdgeInsets.only(left: 20.0, top: 10, right: 20.0),
                        child: ElevatedButton(
                          child: Text('Pagar'),
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(
                      color: Colors.blueGrey[150],
                      thickness: 1,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0, left: 20.0),
                    width: double.infinity,
                    child: Text(
                      'Boleto bancário',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 5.0, left: 20.0),
                          child: Text(
                            'Gerar boleto',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 15.0),
                        child: TextButton.icon(
                          icon: Image.asset(
                            'images/boleto.png',
                            width: 80,
                          ),
                          onPressed: () {},
                          label: Text(''),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          '*Até 3 dias úteis para confirmação do pagamento.',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
