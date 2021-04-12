import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokecenter/bases/base.view.dart';
import 'package:pokecenter/controller/agendamento.controller.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AgendamentoView extends BaseViewStateful {
  AgendamentoView({
    Key key,
  }) : super(key: key, controller: AgendamentController());

  @override
  _AgendamentoViewState createState() => _AgendamentoViewState();
}

class _AgendamentoViewState extends BaseViewState {
  final TextEditingController _controllerEmail = new TextEditingController();
  final TextEditingController _controllerSenha = new TextEditingController();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String value = "";

  @override
  String title() => "Agendamento";

  @override
  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(300))
              ),

              child:
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: form(),
              ))
        ],
      ),
    );
  }

  Widget form() {
    return Column(
      children: [
        _caixasTexto("Nome", "Insira seu nome"),
        _botaoSalvar(),
      ],
    );
  }

  Widget _caixasTexto(String entrada,String errorMessage){
    return TextFormField(
      decoration: InputDecoration(labelText: entrada),
      validator: (value) {
        if (value.isEmpty) {
          return errorMessage;
        }
        return null;
      },
      onSaved: (val) => setState(() => value = val),
    );
  }

  Widget _botaoSalvar() {
    return ElevatedButton(
      onPressed: () {
        // Validate returns true if the form is valid, or false otherwise.
        if (_formKey.currentState.validate()) {
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Processing Data')));
        }
      },
      child: Text('Salvar'),
    );
  }
}
