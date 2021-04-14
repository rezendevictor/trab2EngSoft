import 'dart:convert';

import 'package:pokecenter/bases/base.controller.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class ListagemController extends BaseController {
  BehaviorSubject<List> _streamInfos = BehaviorSubject<List>();

  Stream<List> get streamInfos => _streamInfos.stream;

  BehaviorSubject<String> _streamCategoria = BehaviorSubject<String>();

  Stream<String> get categoriaAtual => _streamCategoria.stream;

  List<String> listasDisponiveis = [
    "albums",
    "todos",
    "Médicos",
    "Pacientes",
    "Funcionários",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos"
  ];

//https://jsonplaceholder.typicode.com/todos/


  Future<Iterable> fetchListByCategory(String category) async{
    switch(category){
      case 'Pacientes':
        return _getPacientes();
      case 'Médicos':
        return getMedicos();
      case 'Funcionários':
        return _getEmployees();
      case 'Endereços':
        return getEnderecos();
      case 'Agendamentos':
        return getAppointments();
      case 'Meus Agendamentos':
        return getMyAppointments();
      default:
        http.Response response = await http.get(Uri.https('jsonplaceholder.typicode.com', '$category/'));
        return json.decode(response.body);
    }

  }

  void categoriaSelecionada(String selecionado) {
    _streamCategoria.sink.add(selecionado);
  }

  Future<Iterable> _getPacientes() async {
    return parseBody(await http.get(Uri.http('localhost:3000', '/')));
  }
  Future<Iterable> _getEmployees() async {
    return parseBody(await http.get(Uri.http('localhost:3000', '/auth/getEmployees')));
  }
  Future<Iterable> getMedicos() async {
    return parseBody(await http.get(Uri.http('localhost:3000', '/auth/getDoctors')));
  }
  Future<Iterable> getEnderecos() async {
    return parseBody(await http.get(Uri.http('localhost:3000', '/address/')));
  }
  Future<Iterable> getAppointments() async {
    return parseBody(await http.get(Uri.http('localhost:3000', '/appointment')));
  }
  Future<Iterable> getMyAppointments() async {
    return parseBody(await http.get(Uri.http('localhost:3000', '/appointment')));
  }

  Iterable parseBody(http.Response response){
    if(response.statusCode == 200){
      return json.decode(response.body)['data'];
    }
    return [];
  }


}
