class Usuario {
  String nome;
  String cpf;
  String dataNascimento;
  String email;
  String celular;
  String endereco;
  String cep;
  String cidade;
  String estado;
  String complemento;
  String bairro;
  String sexo;

  //pedidos
  Object pedido = [];

  //login
  String username;
  String senha;
  //estado login
  bool logado = false;
  Usuario();
}
