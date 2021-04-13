import 'package:pokecenter/bases/base.controller.dart';
import 'package:pokecenter/model/agenda.model.dart';
import 'package:rxdart/rxdart.dart';

class AgendamentoController extends BaseController {
  BehaviorSubject<String> _streamCategoria = BehaviorSubject<String>();

  Stream<String> get categoriaAtual => _streamCategoria.stream;

  BehaviorSubject<String> _streamMedico = BehaviorSubject<String>();

  Stream<String> get medicoaAtual => _streamMedico.stream;

  BehaviorSubject<String> _streamHorario = BehaviorSubject<String>();

  Stream<String> get horarioAtual => _streamHorario.stream;

  BehaviorSubject<AgendaModel> _streamAgenda = BehaviorSubject<AgendaModel>();

  Stream<AgendaModel> get agendaAtual => _streamAgenda.stream;

  BehaviorSubject<DateTime> _streamDia = BehaviorSubject<DateTime>();

  Stream<DateTime> get diaAtual => _streamDia.stream;

  AgendaModel local = new AgendaModel();

  initState() {

  }

  void diaSelecionada(DateTime selecionado) {
    local.dia = selecionado;
    local.data = this.diaehora();
    _streamAgenda.add(local);
    _streamDia.sink.add(selecionado);
  }

  List<String> areasDisponiveis = [
    "Farmacologia1",
    "Farmacologia2",
    "Farmacologia3",
    "Farmacologia4",
  ];

  void categoriaSelecionada(String selecionado) {
    local.especialidade = selecionado;
    _streamAgenda.add(local);
    _streamCategoria.sink.add(selecionado);
  }

  List<String> medicosDisponiveis = [
    "Dr.Mamaco1",
    "Dr.Mamaco2",
    "Dr.Mamaco3",
    "Dr.Mamaco4",
    "Dr.Mamaco5",
  ];

  void medicosSelecionada(String selecionado) {
    local.medico = selecionado;
    _streamAgenda.add(local);
    _streamMedico.sink.add(selecionado);
  }

  List<String> horariosDisponiveis = [
    "12:31",
    "12:32",
    "12:33",
    "12:34",
    "12:35",
    "12:36",
    "12:37",
    "12:38",
  ];

  void horariosSelecionada(String selecionado) {
    local.hora = selecionado;
    _streamAgenda.add(local);
    _streamHorario.sink.add(selecionado);
  }

  String diaehora() {
    String dia = local.dia.day.toString();
    String mes = local.dia.month.toString();
    return dia + "/" + mes;
  }
}
