import 'dart:convert';

import 'package:pokecenter/bases/base.controller.dart';
import 'package:http/http.dart' as http;


class cadastroController extends BaseController{

  String nome, especialidade, crm, email, peso, altura, cep, logradouro, bairro, cidade, estado = 'MG';
  String userType = 'Funcionário';

  Future<http.Response> createAlbum(
      String nome,String especialidade,
      String crm,String email,
      String peso,String altura,
      String cep,String logradouro,
      String bairro,String cidade,
      String estado) async =>
      http.post(
      Uri.https('', 'albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': nome,
        'especialidade' : especialidade,
        "crm" : crm,
        "email" : email,
        "peso" : peso,
        "altura" : altura,
        "cep":cep,
        "logradouro" : logradouro,
        "neighbor": bairro,
        "city" : cidade,
        "state": estado,

      }),
    );

,
  "street":"rua XXXXX",
  "contractDate":"10/11/2018",
  "salary":"4000",
  "username":"chriscmcanta",
  "password":"123456",
  "email":"chris@gmail.com",
  "isDoc": "false"

}