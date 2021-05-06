import 'dart:convert';

import 'package:flutter/material.dart';
import 'TelaLogin.dart';
import 'TelaSobre.dart';
import 'main.dart';
import 'Usuario.dart';

Usuario usuario = new Usuario();

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Casa das Meias - Cadastro',
      home: CadastroUsuario(),
      routes: <String, WidgetBuilder>{
        '/TelaLogin': (context) => TelaLogin(),
        '/TelaSobre': (context) => TelaSobre(),
        '/MenuPrincipal': (context) => MenuPrincipal(),
        '/TelaCadastro': (context) => CadastroUsuario(),
      },
    );
  }
}

class CadastroUsuario extends StatefulWidget {
  @override
  _CadastroUsuarioState createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {
  //variaveis
  //
  bool concordo = false;
  Color corBotaoCadastrar = Colors.grey[500];

  TextEditingController nome = TextEditingController();
  TextEditingController cpf = TextEditingController();
  TextEditingController dataNascimento = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController celular = TextEditingController();
  TextEditingController endereco = TextEditingController();
  TextEditingController cep = TextEditingController();
  TextEditingController estado = TextEditingController();
  TextEditingController cidade = TextEditingController();
  TextEditingController complemento = TextEditingController();
  TextEditingController bairro = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController senha = TextEditingController();

  String radioBotaoSelecionado = "";
  void sexoRadio(String value) {
    setState(() {
      radioBotaoSelecionado = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            //area do logo
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(10.0),
                width: double.infinity,
                color: Color.fromRGBO(3, 136, 166, 1.0),
                child: Image.asset(
                  'images/logo_branco.png',
                  width: 100,
                ),
              ),
            ),

            //
            //area do formaulario
            //

            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Text(
                                  'Dados pessoais',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          //NOME COMPLETO
                          TextFormField(
                            maxLength: 40,
                            controller: nome,
                            decoration: InputDecoration(
                              labelText: 'Nome completo',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),

                          //SEXO (masculino)
                          RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            value: 'Masculino',
                            groupValue: radioBotaoSelecionado,
                            title: Text('Masculino'),
                            onChanged: (String value) {
                              sexoRadio(value);
                            },
                          ),

                          //SEXO (feminino)
                          RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            value: 'Feminino',
                            groupValue: radioBotaoSelecionado,
                            title: Text('Feminino'),
                            onChanged: (String value) {
                              sexoRadio(value);
                            },
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          //CPF
                          TextFormField(
                            onChanged: (String txt) {
                              print(txt);
                              setState(() {});
                            },
                            maxLength: 14,
                            controller: cpf,
                            decoration: InputDecoration(
                              labelText: 'CPF',
                              border: OutlineInputBorder(),
                              hintText: '000.000.000-00',
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          //DATA NASCIMENTO
                          TextFormField(
                            controller: dataNascimento,
                            decoration: InputDecoration(
                              labelText: 'Data nascimento',
                              border: OutlineInputBorder(),
                              hintText: 'dd/mm/aaaa',
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),

                          //EMAIL
                          TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              labelText: 'E-mail',
                              border: OutlineInputBorder(),
                              hintText: 'Exemplo: usuario@gmail.com.br',
                            ),
                          ),

                          SizedBox(
                            height: 5.0,
                          ),

                          //CELULAR
                          TextFormField(
                            controller: celular,
                            decoration: InputDecoration(
                                labelText: 'Celular',
                                border: OutlineInputBorder(),
                                hintText: '(16) 99999 - 9999'),
                          ),
                          SizedBox(
                            height: 50,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Text(
                                  'Dados de entrega',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),

                          //ENDEREÇO
                          TextFormField(
                            controller: endereco,
                            decoration: InputDecoration(
                                labelText: 'Endereço',
                                border: OutlineInputBorder(),
                                hintText: 'Rua/Avenida/Travessa/Alameda'),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),

                          //CEP
                          TextFormField(
                            controller: cep,
                            decoration: InputDecoration(
                                labelText: 'CEP',
                                border: OutlineInputBorder(),
                                hintText: '00000-000'),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),

                          TextFormField(
                            controller: estado,
                            decoration: InputDecoration(
                                labelText: 'Estado',
                                border: OutlineInputBorder(),
                                hintText: 'Ex: São Paulo'),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),

                          TextFormField(
                            controller: cidade,
                            decoration: InputDecoration(
                                labelText: 'Cidade',
                                border: OutlineInputBorder(),
                                hintText: 'Ex: Ribeirão Preto'),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          TextFormField(
                            controller: complemento,
                            decoration: InputDecoration(
                                labelText: 'Complemento',
                                border: OutlineInputBorder(),
                                hintText: 'Apartamento: 12; Bloco: 10'),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),

                          TextFormField(
                            controller: bairro,
                            decoration: InputDecoration(
                                labelText: 'Bairro',
                                border: OutlineInputBorder(),
                                hintText: 'Ex: Centro'),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Text(
                                  'Login',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),

                          //ENDEREÇO
                          TextFormField(
                            maxLength: 40,
                            controller: username,
                            decoration: InputDecoration(
                                labelText: 'Usuário',
                                border: OutlineInputBorder(),
                                hintText: 'Nome ou email'),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),

                          TextFormField(
                            obscureText: true,
                            controller: senha,
                            decoration: InputDecoration(
                                labelText: 'Senha',
                                border: OutlineInputBorder(),
                                hintText: 'Mínimo 8 digitos'),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),

                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: 'Confirmar senha',
                                border: OutlineInputBorder(),
                                hintText: 'digite a senha novamente'),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Termos de uso de dados",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(
                                "Li e concordo com os termos de uso de dados."),
                            value: concordo,
                            selected: concordo,
                            onChanged: (bool valor) {
                              setState(() {
                                if (valor == true)
                                  corBotaoCadastrar = Colors.blue;
                                else
                                  corBotaoCadastrar = Colors.grey[500];
                                concordo = valor;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Container(
              color: Colors.red,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      label: Text(
                        'Voltar',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(11, 11, 13, 1.0),
                        ),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 25.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.check),
                      onPressed: () {
                        setState(() {
                          if (concordo == true) {
                            usuario.nome = nome.text;
                            usuario.cpf = cpf.text;
                            usuario.dataNascimento = dataNascimento.text;
                            usuario.email = email.text;
                            usuario.celular = celular.text;
                            usuario.endereco = endereco.text;
                            usuario.cep = cep.text;
                            usuario.cidade = cidade.text;
                            usuario.estado = estado.text;
                            usuario.complemento = complemento.text;
                            usuario.bairro = bairro.text;
                            usuario.sexo = radioBotaoSelecionado;
                            usuario.username = username.text;
                            usuario.senha = senha.text;
                            Navigator.pushNamed(context, '/TelaLogin');
                          }
                        });
                      },
                      label: Text(
                        'Cadastrar',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 25.0),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(corBotaoCadastrar),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),

      ///botoes
    );
  }
}
