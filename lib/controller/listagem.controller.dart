import 'package:pokecenter/bases/base.controller.dart';
import 'package:rxdart/rxdart.dart';

class ListagemController extends BaseController {
  BehaviorSubject<List> _streamInfos = BehaviorSubject<List>();

  Stream<List> get streamInfos => _streamInfos.stream;

  BehaviorSubject<String> _streamCategoria = BehaviorSubject<String>();

  Stream<String> get categoriaAtual => _streamCategoria.stream;

  List<String> listasDisponiveis = [
    "Funcionarios",
    "Pacientes",
    "Endereços",
    "Agendamentos",
    "Meus Agendamentos"
  ];

  void categoriaSelecionada(String selecionado) {
    _streamCategoria.sink.add(selecionado);
  }
}
