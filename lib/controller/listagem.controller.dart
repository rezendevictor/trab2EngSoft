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
    "Pacientes",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos"
  ];
//https://jsonplaceholder.typicode.com/todos/
  List<String> teste = [
    "Funcionarios",
    "Pacientes",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos",
    "Funcionarios",
    "Pacientes",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos", "Funcionarios",
    "Pacientes",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos", "Funcionarios",
    "Pacientes",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos", "Funcionarios",
    "Pacientes",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos", "Funcionarios",
    "Pacientes",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos", "Funcionarios",
    "Pacientes",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos", "Funcionarios",
    "Pacientes",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos", "Funcionarios",
    "Pacientes",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos", "Funcionarios",
    "Pacientes",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos", "Funcionarios",
    "Pacientes",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos", "Funcionarios",
    "Pacientes",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos", "Funcionarios",
    "Pacientes",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos", "Funcionarios",
    "Pacientes",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos", "Funcionarios",
    "Pacientes",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos", "Funcionarios",
    "Pacientes",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos", "Funcionarios",
    "Pacientes",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos", "Funcionarios",
    "Pacientes",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos", "Funcionarios",
    "Pacientes",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos", "Funcionarios",
    "Pacientes",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos", "Funcionarios",
    "Pacientes",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos",
  ];

  Future<http.Response> fetchListByCategory(String category) {
    return http.get(Uri.https('jsonplaceholder.typicode.com', '$category/'));
  }

  void categoriaSelecionada(String selecionado) {
    _streamCategoria.sink.add(selecionado);
  }
}
