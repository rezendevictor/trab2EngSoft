import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokecenter/bases/base.view.dart';
import 'package:pokecenter/controller/home.controller.dart';


class CadastroUsuarioView extends BaseViewStateful {


  CadastroUsuarioView({Key key, }) : super(key: key, controller: HomeController());


  @override
  _CadastroUsuarioViewState createState() => _CadastroUsuarioViewState();
}


class _CadastroUsuarioViewState extends BaseViewState {
  List<String> userTypes = ['Funcionário', 'Paciente'];
  List<String> estados = ['AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'];
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String nome, especialidade, crm, email, peso, altura, cep, logradouro, bairro, cidade, estado = 'MG';
  String userType = 'Funcionário';
  bool employeeIsDoctor = false;

  @override
  String title() => "Cadastro de Usuário";

  @override
  Widget body(){

    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
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

  Widget _numberField(String hint, validator, FormFieldSetter<String> onSave) {
    return new TextFormField(
      decoration: new InputDecoration(hintText: hint),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      maxLength: 40,
      validator: validator,
      onSaved: onSave,
    );
  }

  Widget _dropDown(title, items, dropdownValue, onChanged){
    return Row(
      children: [
        Text(title),
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
        _dropDown("Tipo de usuário: ", userTypes, userType, (newValue) {
          setState(() {
            userType = newValue;
          });
        }),
        _textField('Nome', textValidator, (newValue) { nome = newValue; }),
        _textField('CEP', cepValidator, (newValue) { cep = newValue; }),
        _textField('Logradouro', textValidator, (newValue) { logradouro = newValue; }),
        Row(
          children: [
            Expanded(child: _textField('Bairro', textValidator, (newValue) { bairro = newValue; })),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 100),
                  child: _dropDown("Estado: ", estados, estado, (newValue) {
                    setState(() {
                      estado = newValue;
                    });
                  }),
                )
            ),
          ],
        ),
        _textField('Cidade', textValidator, (newValue) { cidade = newValue; }),
        ..._getPatientFields(),
        ..._getEmployeeFields(),
        new RaisedButton(
          onPressed: _sendForm,
          child: new Text('Enviar'),
        )
      ],
    );
  }

  List<Widget> _getEmployeeFields(){
    FormFieldValidator<String> textValidator = _validator("Informe este campo", "O nome deve conter caracteres de a-z ou A-Z", r'(^[a-zA-Z ]*$)');

    if(userType == 'Funcionário'){
      Widget doctorFields = Row(
        children: [
          Expanded(child: _textField('Especialidade', textValidator, (newValue) { especialidade = newValue; })),
          Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 100),
                child: _textField('CRM', textValidator, (newValue) { crm = newValue; }),
              )
          ),
        ],
      );

      Widget isDoctorCheckbox = Row(
        children: [
          Text("Funcionário é médico: "),
          Checkbox(
            value: employeeIsDoctor,
            onChanged: (bool value) {
              setState(() {
                employeeIsDoctor = value;
              });
            },
          ),
        ],
      );

      if(employeeIsDoctor){
        return [
          isDoctorCheckbox,
          doctorFields
        ];
      }else{
        return [
          isDoctorCheckbox,
        ];
      }
    }
    return [];
  }

  List<Widget> _getPatientFields(){
    FormFieldValidator<String> numberValidator = _validator("Informe este campo", "O nome deve conter apenas números ou pontuações", r'(^\d*\.?\d*$)');

    if(userType == 'Paciente'){
      return [
        Row(
          children: [
            Expanded(child: _numberField('Peso', numberValidator, (newValue) { peso = newValue; })),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 100),
                  child: _numberField('Altura', numberValidator, (newValue) { altura = newValue; }),
                )
            ),
          ],
        ),
        _textField('Email', _validarEmail, (newValue) { email = newValue; }),
      ];
    }
    return [];
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

