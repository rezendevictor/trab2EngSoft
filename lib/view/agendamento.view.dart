import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokecenter/bases/base.view.dart';
import 'package:pokecenter/controller/agendamento.controller.dart';
import 'package:table_calendar/table_calendar.dart';

class AgendamentoView extends BaseViewStateful {
  AgendamentoView({
    Key key,
  }) : super(key: key, controller: AgendamentoController());

  @override
  _AgendamentoViewState createState() => _AgendamentoViewState();
}

class _AgendamentoViewState extends BaseViewState {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  AgendamentoController _controller = new AgendamentoController();

  String value = "";

  @override
  String title() => "Agendamento";

  @override
  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: form(),
            )
          ],
        ),
      ),
    );
  }

  Widget form() {
    return Column(
      children: [
        Center(child: _selections()),
        Center(child: _botaoSalvar()),
      ],
    );
  }

  Widget _selections() {
    return Row(children: [
      _oqueequem(),
      _streamConsulta(),
    ]);
  }

  Widget _oqueequem() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: 300,
        child: Column(
          children: [
            _streamSelecionarLista(),
            _streamSelecionarMedico(),
            selectDate(),
            _streamSelecionarHora()
          ],
        ),
      ),
    );
  }

  Widget _streamSelecionarLista() {
    return StreamBuilder(
        stream: _controller.categoriaAtual,
        builder: (context, snapshot) {
          return _selecionarLista(snapshot.data);
        });
  }

  Widget _selecionarLista(String selected) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 8, bottom: 8),
      child: DropdownButton<String>(
        isExpanded: true,
        hint: Text("Selecione Especialidade"),
        value: selected,
        icon: Icon(
          Icons.arrow_downward,
          color: Colors.black,
        ),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.black, fontSize: 18),
        underline: Container(
          height: 2,
          color: Colors.blueGrey,
        ),
        onChanged: (String newValue) {
          _controller.categoriaSelecionada(newValue);
        },
        items: _controller.areasDisponiveis
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _streamSelecionarMedico() {
    return StreamBuilder(
        stream: _controller.medicoaAtual,
        builder: (context, snapshot) {
          return _selecionarMedico(snapshot.data);
        });
  }

  Widget _selecionarMedico(String selected) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 8, bottom: 8),
      child: DropdownButton<String>(
        isExpanded: true,
        hint: Text("Selecione o M??dico"),
        value: selected,
        icon: Icon(
          Icons.arrow_downward,
          color: Colors.black,
        ),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.black, fontSize: 18),
        underline: Container(
          height: 2,
          color: Colors.blueGrey,
        ),
        onChanged: (String newValue) {
          _controller..medicosSelecionada(newValue);
        },
        items: _controller.medicosDisponiveis
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _botaoSalvar() {
    return Container(
      width: 150,
      height: 50,
      color: Colors.blueGrey,
      child: Center(
        child: InkWell(
          onTap: () {
            print(_controller.local);
          },
          child: Text(
            'Agendar',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget calendar() {
    var _controller = CalendarController();

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TableCalendar(
            initialCalendarFormat: CalendarFormat.month,
            calendarStyle: CalendarStyle(
                todayColor: Colors.blue,
                selectedColor: Theme.of(context).primaryColor,
                todayStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Colors.white)),
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonDecoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(22.0),
              ),
              formatButtonTextStyle: TextStyle(color: Colors.white),
              formatButtonShowsNext: false,
            ),
            startingDayOfWeek: StartingDayOfWeek.monday,
            builders: CalendarBuilders(
              selectedDayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  )),
              todayDayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            calendarController: _controller,
          )
        ]);
  }

  Widget _streamSelecionarHora() {
    return StreamBuilder(
        stream: _controller.horarioAtual,
        builder: (context, snapshot) {
          return _selecionarHora(snapshot.data);
        });
  }

  Widget _selecionarHora(String selected) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 8, bottom: 8),
      child: DropdownButton<String>(
        isExpanded: true,
        hint: Text("Hor??rio"),
        value: selected,
        icon: Icon(
          Icons.arrow_downward,
          color: Colors.black,
        ),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.black, fontSize: 18),
        underline: Container(
          height: 2,
          color: Colors.blueGrey,
        ),
        onChanged: (String newValue) {
          _controller.horariosSelecionada(newValue);
        },
        items: _controller.horariosDisponiveis
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget selectDate() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.blueGrey),
            child: TextButton(
              onPressed: () => _selectDate(context),
              child: Text(
                'Selecionar Data',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      _controller.diaSelecionada(pickedDate);
  }

  Widget _streamConsulta() {
    return StreamBuilder<Object>(
        stream: _controller.agendaAtual,
        builder: (context, snapshot) {
          return SizedBox(
              height: 300, width: 400, child: _consultaVisualization());
        });
  }

  Widget _consultaVisualization() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20, top: 50),
            child: Text(
              "Datalhes do Agentamento : ",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Especialidade: ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                _controller.local.especialidade,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "M??dico: ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  _controller.local.medico,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Data: ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(_controller.local.data,
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Hora: ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(_controller.local.hora,
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
