import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokecenter/bases/base.view.dart';
import 'package:pokecenter/controller/home.controller.dart';


class CadastroView extends BaseViewStateful {


  CadastroView({Key key, }) : super(key: key, controller: HomeController());


  @override
  _CadastroViewState createState() => _CadastroViewState();
}


class _CadastroViewState extends BaseViewState {

  List<String> estados = ['AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'];
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String cep, logradouro, bairro, cidade, estado = 'MG';

  @override
  String title() => "Cadastro de Endereços";

  @override
  Widget body(){

    return Padding(
      padding: EdgeInsets.all(50.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(100.0),
          child: new Form(
            key: _key,
            autovalidate: _validate,
            child: _formUI(),
          ),
        ),
      ),
    );
  }

  Widget _textField(String hint, validator, FormFieldSetter<String> onSave) {
    return new TextFormField(
      decoration: new InputDecoration(hintText: hint),
      maxLength: 40,
      validator: validator,
      onSaved: onSave,
    );
  }

  Widget _dropDown(items, dropdownValue, onChanged){
    return Row(
      children: [
        Text("Estado: "),
        DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.grey,
          ),
          onChanged: onChanged,
          items: items
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
      ],
    );
  }

  Widget _formUI() {
    FormFieldValidator<String> textValidator = _validator("Informe este campo", "O nome deve conter caracteres de a-z ou A-Z", r'(^[a-zA-Z ]*$)');
    FormFieldValidator<String> cepValidator = _validator("Informe este campo", "O nome deve conter caracteres de numeros ou - apenas", r'[0-9]{5}-[0-9]{3}');

    return new Column(
      children: <Widget>[
        _textField('CEP', cepValidator, (newValue) { cep = newValue; }),
        _textField('Logradouro', textValidator, (newValue) { logradouro = newValue; }),
        _textField('Bairro', textValidator, (newValue) { bairro = newValue; }),
        _textField('Cidade', textValidator, (newValue) { cidade = newValue; }),
        _dropDown(estados, estado, (newValue) {
          setState(() {
            estado = newValue;
          });
        }),
        new SizedBox(height: 15.0),
        new RaisedButton(
          onPressed: _sendForm,
          child: new Text('Enviar'),
        )
      ],
    );
  }

  _validator(String rule, String instructions, String pattern){
    return (String value) {
      RegExp regExp = new RegExp(pattern);
      if (value.length == 0) {
        return rule;
      } else if (!regExp.hasMatch(value)) {
        return instructions;
      }
      return null;
    };
  }

  String _validarEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Informe o Email";
    } else if(!regExp.hasMatch(value)){
      return "Email inválido";
    }else {
      return null;
    }
  }

  _sendForm() {
    if (_key.currentState.validate()) {
      // Sem erros na validação
      _key.currentState.save();
      // print("Nome $nome");
      // print("Ceclular $celular");
      // print("Email $email");
    } else {
      // erro de validação
      setState(() {
        _validate = true;
      });
    }
  }
}

