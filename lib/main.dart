import 'package:flutter/material.dart';
import 'TelaLogin.dart';
import 'TelaSobre.dart';
import 'Cartao.dart';
import 'CartaoDestaque.dart';
import 'CadastroUsuario.dart';
import 'TelaCarrinho.dart';
import 'Produto.dart';
import 'TelaPagamentoPedido.dart';

//criando produtos que serao exibidos para o cliente
//futuramente essa parte virá do banco de dados
//

Produto mascara = new Produto(
  /* path foto*/ 'images/mascaraLupoPreta.jpg',
  /* titulo*/ 'MÁSCARA ZERO COSTURA\nVÍRUS BAC-OFF',
  /* descrição*/ 'Higienizada - Pronta para uso\nInativa vírus - Dupla camada\n Contém: 2 unidades',
  /* preço*/ 24.00,
  /* quant. estoque*/ 10,
);

Produto meiaCalcaLobaFio80 = new Produto(
  /* path foto*/ 'images/meiaCalcaLOba.jpg',
  /* titulo*/ 'MEIA CALÇA LOBA\nOPACA',
  /* descrição*/ 'Acrílico - Com elastano\nForro de algodão - Fio 80\n Contém: 1 unidade',
  /* preço*/ 25.00,
  /* quant. estoque*/ 10,
);

Produto kit3MeiasCanoLongoSportAlgodao = new Produto(
  /* path foto*/ 'images/kit3MeiasCanoLongoSportAlgodao.jpg',
  /* titulo*/ 'KIT 3 MEIAS CANO LONGO\nSPORT LUPO',
  /* descrição*/ '100% Algodão\nCores: preta, cinza e chumbo\n Contém: 3 pares',
  /* preço*/ 44.90,
  /* quant. estoque*/ 10,
);

Produto kit3MeiasSoqueteSportAlgodao = new Produto(
  /* path foto*/ 'images/kit3MeiasSoqueteSportAlgodao.jpg',
  /* titulo*/ 'KIT 3 MEIAS SOQUETE SPORT\nLUPO',
  /* descrição*/ '100% Algodão\nCores: branca e cinza\n Contém: 3 pares',
  /* preço*/ 42.90,
  /* quant. estoque*/ 10,
);

Produto cuecaSlipSemCostura = new Produto(
  /* path foto*/ 'images/cuecaSlipSemCostura.jpg',
  /* titulo*/ 'CUECA SLIP SEM COSTURA\nLUPO',
  /* descrição*/ '100% Algodão\nCor: azul\n Contém: 1 unidade',
  /* preço*/ 14.90,
  /* quant. estoque*/ 10,
);

//
//fim da criação dos produtos
//

//criação da lista de pedido
List<Produto> listaCarrinho = [];

class IconeTemItemCarrinho extends StatefulWidget {
  @override
  _IconeTemItemCarrinhoState createState() => _IconeTemItemCarrinhoState();
}

class _IconeTemItemCarrinhoState extends State<IconeTemItemCarrinho> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 15),
      padding: EdgeInsets.zero,
      width: 5,
      height: 5,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }
}

//ícone de controle de itens no carrinho
Widget temItemCarrinho = new Container();

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(3, 136, 166, 1.0),
        buttonColor: Color.fromRGBO(242, 136, 75, 1.0),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Casa das Meias',
      initialRoute: '/TelaLogin',
      routes: <String, WidgetBuilder>{
        '/TelaLogin': (context) => TelaLogin(),
        '/TelaSobre': (context) => TelaSobre(),
        '/MenuPrincipal': (context) => MenuPrincipal(),
        '/TelaCadastro': (context) => CadastroUsuario(),
        '/TelaCarrinho': (context) => TelaCarrinho(),
        '/TelaPagamentoPedido': (context) => TelaPagamentoPedido(),
      },
    ),
  );
}

class MenuPrincipal extends StatefulWidget {
  @override
  _MenuPrincipalState createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  //variaveis

  int _currentIndex = 0;
  IconData iconeLogin = Icons.login;
  Icon _iconInicio = Icon(Icons.home_filled);
  Icon _iconProduto = Icon(Icons.list);
  Icon _iconCarrinho = Icon(Icons.local_grocery_store_outlined);
  Icon _iconSobre = Icon(Icons.info);
  Text saudacao = Text(
    'Seja bem-vindo!',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 16,
      color: Colors.white,
    ),
  );

  @override
  void initState() {
    _currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(
      () {
        if (usuario.logado) {
          saudacao = Text(
            'Seja bem-vindo,\n ${usuario.nome}!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          );
          iconeLogin = Icons.account_circle;
        }

        if (listaCarrinho.length > 0) {
          temItemCarrinho = new IconeTemItemCarrinho();
          _iconCarrinho = Icon(
            Icons.local_grocery_store_outlined,
            size: 25,
          );
        } else
          temItemCarrinho = new Container();
      },
    );
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DrawerHeader(
                    margin: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 80,
                          color: Colors.grey[100],
                        ),
                        saudacao,
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.zero,
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Minha conta'),
                      onTap: () {},
                      hoverColor: Color.fromRGBO(242, 184, 133, 1.0),
                    ),
                    Divider(
                      color: Colors.grey[200],
                      thickness: 2,
                    ),
                    ListTile(
                      leading: Icon(Icons.reorder),
                      title: Text('Meus pedidos'),
                      onTap: () {},
                      hoverColor: Color.fromRGBO(242, 184, 133, 1.0),
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Configurações'),
                      onTap: () {},
                      hoverColor: Color.fromRGBO(242, 184, 133, 1.0),
                    ),
                    ListTile(
                      enabled: true,
                      leading: Icon(Icons.logout),
                      title: Text('Sair'),
                      onTap: () {
                        setState(() {
                          usuario.logado = false;
                          iconeLogin = Icons.login;
                          saudacao = Text(
                            'Seja bem-vindo!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          );
                        });
                      },
                      hoverColor: Color.fromRGBO(242, 184, 133, 1.0),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Casa das Meias"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.zero,
                icon: Icon(iconeLogin, color: Colors.white, size: 30.0),
                onPressed: () {
                  setState(() {
                    if (!usuario.logado) {
                      Navigator.pushNamed(context, '/TelaLogin');
                    }
                  });
                }),
          ),
        ],
      ),

      //corpo da aplicacao
      body: Center(
        child: Padding(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Produtos em destaque',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Scrollbar(
                  child: ListView(
                    controller: ScrollController(),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                    scrollDirection: Axis.horizontal,
                    children: [
                      //card produtos destaque
                      new CartaoDestaque(mascara),
                      new CartaoDestaque(meiaCalcaLobaFio80),
                      new CartaoDestaque(kit3MeiasCanoLongoSportAlgodao),

                      // card produts destaque
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Todos os Produtos',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 2,
                child: Scrollbar(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      new Cartao(mascara),
                      new Cartao(meiaCalcaLobaFio80),
                      new Cartao(kit3MeiasCanoLongoSportAlgodao),
                      new Cartao(kit3MeiasSoqueteSportAlgodao),
                      new Cartao(cuecaSlipSemCostura),
                    ],
                  ),
                ),
              )
            ],
          ),
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
            icon: Column(
              children: [
                temItemCarrinho,
                _iconCarrinho,
              ],
            ),
            label: 'Carrinho',
          ),
          BottomNavigationBarItem(
            icon: _iconSobre,
            label: 'Sobre',
          ),
        ],
        backgroundColor: Color.fromRGBO(242, 202, 82, 1.0),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
