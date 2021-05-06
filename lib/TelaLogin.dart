import 'package:flutter/material.dart';
import 'CadastroUsuario.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  bool visibilidadeSenha = true;
  Icon iconeVisibilidade = Icon(Icons.visibility_off);
  TextEditingController login = TextEditingController();
  TextEditingController senha = TextEditingController();
  var formKeyLogin = GlobalKey<FormState>();
  var formKeySenha = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      //boddy
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: Center(
          child: Column(
            children: [
              //ESPAÇO DO LOGOTIPOS
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Image.asset(
                      'images/logo.png',
                      width: 300,
                    ),
                  ),
                ),
              ),
              //ESPAÇO DO LOGOTIPO

              //INÍCIO DO FORMULARIO
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.fromLTRB(60.0, 30.0, 60.0, 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Form(
                          key: formKeyLogin,
                          child: TextFormField(
                            validator: (String value) {
                              if (value.length < 8) {
                                return "Digite pelo menos 8 caracteres";
                              } else {
                                return null;
                              }
                            },
                            controller: login,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              //hintText: "Nome",
                              labelText: "Usuário",
                              errorStyle: TextStyle(
                                fontSize: 12,
                              ),
                              labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                              ),

                              border: OutlineInputBorder(),
                              fillColor: Colors.blue[30],
                              filled: false,
                              suffixIcon: Icon(
                                Icons.keyboard,
                                size: 30,
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            maxLength: 40,
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Form(
                          key: formKeySenha,
                          child: TextFormField(
                            validator: (String value) {
                              if (value.length < 8) {
                                return "Digite pelo menos 8 caracteres";
                              } else {
                                return null;
                              }
                            },
                            controller: senha,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              //hintText: "Senha",
                              labelText: "Senha",
                              errorStyle: TextStyle(
                                fontSize: 12,
                              ),
                              labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                              ),
                              border: OutlineInputBorder(),
                              fillColor: Colors.blue[30],
                              filled: false,
                              suffixIcon: IconButton(
                                icon: iconeVisibilidade,
                                onPressed: () {
                                  setState(() {
                                    visibilidadeSenha = !visibilidadeSenha;
                                    if (visibilidadeSenha) {
                                      iconeVisibilidade =
                                          Icon(Icons.visibility_off);
                                    } else {
                                      iconeVisibilidade =
                                          Icon(Icons.visibility);
                                    }
                                  });
                                },
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            obscureText: visibilidadeSenha,
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Color.fromRGBO(22, 95, 140, 1.0),
                                      ),
                                    ),
                                    child: Text(
                                      "ENTRAR",
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    onPressed: () {
                                      setState(
                                        () {
                                          if (formKeyLogin.currentState
                                                  .validate() &&
                                              formKeySenha.currentState
                                                  .validate()) {
                                            //usuario.username = login.text;
                                            //usuario.senha = senha.text;

                                            if (usuario.senha == senha.text &&
                                                usuario.username ==
                                                    login.text) {
                                              usuario.logado = true;
                                              Navigator.pushNamed(
                                                  context, '/MenuPrincipal');
                                            } else {
                                              showDialog(
                                                context: context,
                                                builder: (_) => AlertDialog(
                                                  title:
                                                      Text("Falha ao acessar!"),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            'Usuario ou senha inválidos'),
                                                      ],
                                                    ),
                                                  ),
                                                  elevation: 24.0,
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('Fechar'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                          }
                                        },
                                      );
                                    }),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Esqueceu a senha?",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pushNamed(context, '/TelaCadastro');
                              },
                              icon: Icon(Icons.person_add),
                              label: Text('Cadastrar'),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromRGBO(78, 148, 191, 1.0))),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
