import 'package:flutter/material.dart';

class TelaSobre extends StatefulWidget {
  @override
  _TelaSobreState createState() => _TelaSobreState();
}

class _TelaSobreState extends State<TelaSobre> {
  int _currentIndex = 3;

  IconData iconeLogin = Icons.login;

  Icon _iconInicio = Icon(Icons.home_filled);

  Icon _iconProduto = Icon(Icons.list);

  Icon _iconCarrinho = Icon(Icons.local_grocery_store_outlined);

  Icon _iconSobre = Icon(Icons.info);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
      ),

      backgroundColor: Colors.white,
      //body

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    color: Colors.white,
                    child: Image.asset('images/fotoSobre3.jpg'),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    color: Colors.white,
                    child: Text(
                      'Desenvolvedor:\n' + 'Wesley Ferreira Coelho',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    child: Text(
                      'Casa das Meias App Store',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80.0),
                        topRight: Radius.circular(80.0)),
                    color: Color.fromRGBO(78, 148, 191, 0.2),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Aplicativo desenvolvido para venda on-line de produtos da loja Casa das Meias.' +
                              ' A casa das Meias é uma loja de família representante de diversas marcas como Lupo, Kendall e Trifil.' +
                              ' A loja trabalha com diversos tipos de meias, de diversos tamanhos e cores. Há 20 anos no mercado,' +
                              ' a Casa das Meias assim como muitos outros comércios, concentra quase 100% de suas vendas no atendimento presencial aos seus clientes,' +
                              ' e nesse atual momento de pandemia isso gerou grandes perdas no faturamento.' +
                              ' O desenvolvimento do App Casa das Meias visa criar uma alternativa para os clientes poderem fazer suas compras sem sair de casa.' +
                              ' Após realizada a compra pelo o App o cliente poderá receber seus produtos em casa ou retirar na loja, conforme os protocolos de saúde atualmente adotados.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
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
                _iconSobre = Icon(Icons.info_outline);
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
