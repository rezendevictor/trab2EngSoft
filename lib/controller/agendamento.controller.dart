

import 'package:pokecenter/bases/base.controller.dart';
import 'package:pokecenter/model/agenda.model.dart';
import 'package:rxdart/rxdart.dart';

class AgendamentoController extends BaseController{

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

  void diaSelecionada(DateTime selecionado) {
    local.dia = selecionado;
    local.data = this.diaehora();
    _streamAgenda.add(local);
    _streamDia.sink.add(selecionado);
  }


  List<String> areasDisponiveis = [
    "Farmacologia",
    "Farmacologia",
    "Farmacologia",
    "Farmacologia",
  ];

  void categoriaSelecionada(String selecionado) {
    local.especialidade = selecionado;
    _streamAgenda.add(local);
    _streamCategoria.sink.add(selecionado);
  }



  List<String> medicosDisponiveis = [
    "Dr.Mamaco",
    "Dr.Mamaco",
    "Dr.Mamaco",
    "Dr.Mamaco",
    "Dr.Mamaco",
  ];

  void medicosSelecionada(String selecionado) {
    local.medico = selecionado;
    _streamAgenda.add(local);
    _streamMedico.sink.add(selecionado);
  }

  List<String> horariosDisponiveis = [
    "12:30",
    "12:30",
    "12:30",
    "12:30",
    "12:30",
    "12:30",
    "12:30",
    "12:30",

  ];

  void horariosSelecionada(String selecionado) {
    local.hora = selecionado;
    _streamAgenda.add(local);
    _streamHorario.sink.add(selecionado);
  }

  String diaehora(){
    String dia = local.dia.day.toString();
    String mes = local.dia.month.toString();
    return dia+"/"+mes;


  }


}