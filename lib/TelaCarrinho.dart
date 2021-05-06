import 'Pedido.dart';
import 'package:flutter/material.dart';
import 'Produto.dart';
import 'CadastroUsuario.dart';
import 'main.dart';

//var pedido = new Pedido();
//
int quantidadeItem = 1;

class TelaCarrinho extends StatefulWidget {
  @override
  _TelaCarrinhoState createState() => _TelaCarrinhoState();
}

class _TelaCarrinhoState extends State<TelaCarrinho> {
  //variaveis
  int _currentIndex = 2;
  IconData iconeLogin = Icons.login;
  Icon _iconInicio = Icon(Icons.home_filled);
  Icon _iconProduto = Icon(Icons.list);
  Icon _iconCarrinho = Icon(Icons.local_grocery_store);
  Icon _iconSobre = Icon(Icons.info);

  TextEditingController cep = TextEditingController();
  Icon iconeDeleteDiminuiItem = Icon(Icons.delete_outline);
  String radioBotaoSelecionado = "";
  var selectedRadio;
  double valorFrete = 0.0;
  Color corTextoFrete = Colors.grey[200];

  @override
  void initState() {
    selectedRadio = false;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Produto produtoCarrinho = ModalRoute.of(context).settings.arguments;
    double subtotal = 0.0;
    int badgeCarrinho = 0;
    for (int i = 0; i < listaCarrinho.length; i++) {
      subtotal += (listaCarrinho[i].unidade) * (listaCarrinho[i].preco);
      badgeCarrinho += listaCarrinho[i].unidade;
    }

    double total = subtotal + valorFrete;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Carrinho'),
        actions: [
          Icon(
            Icons.local_grocery_store_outlined,
            size: 30,
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 20.0, left: 0.0, right: 10.0),
            padding: EdgeInsets.zero,
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Text(
              badgeCarrinho.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Colors.grey[300],
                            width: 1,
                            style: BorderStyle.solid),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Retirar na loja

                        //Receber em casa
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 150,
                              height: 40,
                              padding: EdgeInsets.only(left: 30, top: 5.0),
                              child: TextField(
                                style: TextStyle(fontSize: 14),
                                enabled: selectedRadio,
                                controller: cep,
                                decoration: InputDecoration(
                                  labelText: 'CEP',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.all(1),
                                ),
                              ),
                            ),
                            Container(
                              width: 120,
                              height: 40,
                              padding: EdgeInsets.only(left: 5, top: 5.0),
                              child: ElevatedButton(
                                child: Text(
                                  'Calcular frete',
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () {
                                  if (cep.text != '') {
                                    setState(() {
                                      corTextoFrete = Colors.black;
                                      valorFrete = 4.00;
                                    });
                                  } else {
                                    setState(() {
                                      corTextoFrete = Colors.grey[200];
                                    });
                                  }
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 150.0),
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    valorFrete.toStringAsPrecision(4),
                                    textAlign: TextAlign.right,
                                    style: TextStyle(color: corTextoFrete),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        /////ALTERNATIVO ENDEREÇO
                        ///
                        ///
                        RadioListTile(
                          selectedTileColor: Colors.red,
                          title: Text(
                            "Receber em casa",
                            style: TextStyle(fontSize: 14),
                          ),
                          value: true,
                          groupValue: selectedRadio,
                          onChanged: (value) {
                            setState(() {
                              if (selectedRadio != null)
                                corTextoFrete = Colors.black;
                              else
                                corTextoFrete = Colors.grey[200];
                              selectedRadio = value;
                            });
                            print(value);
                          },
                        ),
                        RadioListTile(
                          selectedTileColor: Colors.red,
                          title: Text(
                            "Retirar na loja",
                            style: TextStyle(fontSize: 14),
                          ),
                          subtitle: Text(
                            "Rua São Sebastião, 449 - Centro - RP",
                            style: TextStyle(fontSize: 10),
                          ),
                          value: false,
                          groupValue: selectedRadio,
                          onChanged: (value) {
                            setState(() {
                              if (selectedRadio != null)
                                corTextoFrete = Colors.black;
                              else
                                corTextoFrete = Colors.grey[200];
                              selectedRadio = value;
                            });
                            print(value);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Image.asset(
                              listaCarrinho[index].foto,
                              width: 60,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${listaCarrinho[index].titulo}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                  Text(
                                    '${listaCarrinho[index].descricao}',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: IconButton(
                              icon: listaCarrinho[index].iconeDecItem,
                              onPressed: () {
                                setState(() {
                                  if (listaCarrinho[index].unidade > 2) {
                                    listaCarrinho[index].unidade -= 1;
                                  } else if (listaCarrinho[index].unidade ==
                                      2) {
                                    listaCarrinho[index].iconeDecItem =
                                        Icon(Icons.delete_outline);
                                    listaCarrinho[index].unidade -= 1;
                                  } else {
                                    listaCarrinho.removeAt(index);
                                  }
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                  width: 0.5,
                                  color: Colors.black,
                                  style: BorderStyle.solid),
                            ),
                            child: Text(
                              listaCarrinho[index].unidade.toString(),
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: 30,
                            child: IconButton(
                              icon: Icon(Icons.add_circle_outline),
                              onPressed: () {
                                setState(() {
                                  listaCarrinho[index].iconeDecItem =
                                      Icon(Icons.remove_circle_outline);

                                  listaCarrinho[index].unidade += 1;
                                  listaCarrinho[index].imprimeProduto();
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              alignment: Alignment.centerRight,
                              child: Text(listaCarrinho[index]
                                  .preco
                                  .toStringAsPrecision(4)),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.grey[300],
                      thickness: 2,
                    );
                  },
                  itemCount: listaCarrinho.length,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 136, 166, 0.1),
                  border: Border(
                    top: BorderSide(
                        color: Colors.grey[200],
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                              right: 8.0,
                              left: 30.0,
                            ),
                            child: Text(
                              "Subtotal: ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(
                              top: 5.0,
                              right: 30.0,
                              left: 8.0,
                            ),
                            child: Text(
                              "R\$" + subtotal.toStringAsPrecision(4),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 5.0,
                              right: 8.0,
                              left: 30.0,
                            ),
                            child: Text(
                              "Frete: ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(
                              top: 5.0,
                              right: 30.0,
                              left: 8.0,
                            ),
                            child: Text(
                              "R\$" + valorFrete.toStringAsPrecision(4),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 30.0),
                            child: Text(
                              "Total: ",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(
                              top: 5.0,
                              right: 30.0,
                              left: 8.0,
                            ),
                            child: Text(
                              "R\$" + total.toStringAsPrecision(4),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              height: 30,
                              child: ElevatedButton(
                                child: Text(
                                  'Realizar Pedido',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red)),
                                onPressed: () {
                                  setState(() {
                                    if (usuario.logado &&
                                        listaCarrinho.length != 0) {
                                      Pedido pedido = new Pedido();
                                      pedido.valor = total;
                                      pedido.usuario = usuario;
                                      pedido.produto = Navigator.pushNamed(
                                          context, '/TelaPagamentoPedido',
                                          arguments: pedido) as List;
                                    } else if (listaCarrinho.length != 0 &&
                                        usuario.logado == false) {
                                      Navigator.pushNamed(
                                          context, '/TelaLogin');
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12.0,
        selectedIconTheme: IconThemeData(color: Colors.red[900]),
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(
            () {
              _currentIndex = index;

              if (index == 0) {
                _iconInicio = Icon(Icons.home_filled);
                Navigator.pushNamed(context, '/MenuPrincipal');
              } else if (index == 1) {
                _iconProduto = Icon(Icons.list_alt_outlined);
              } else if (index == 2) {
                _iconCarrinho = Icon(Icons.local_grocery_store);
                Navigator.pushNamed(context, '/TelaCarrinho');
              } else if (index == 3) {
                _iconSobre = Icon(Icons.info);
                Navigator.pushNamed(context, '/TelaSobre');
              } else
                _iconSobre = Icon(Icons.info_outlined);
            },
          );
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: _iconInicio,
            label: 'Início',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: _iconProduto,
            label: 'Produtos',
          ),
          BottomNavigationBarItem(
            icon: _iconCarrinho,
            label: 'Carrinho',
          ),
          BottomNavigationBarItem(
            icon: _iconSobre,
            label: 'Sobre',
          ),
        ],
        backgroundColor: Color.fromRGBO(242, 202, 82, 1.0),
      ),
    );
  }
}
