import 'package:pokecenter/bases/base.controller.dart';
import 'package:rxdart/rxdart.dart';

class ListagemController extends BaseController{
  BehaviorSubject<List> _streamInfos = BehaviorSubject<List>();
  Stream<List> get streamInfos => _streamInfos.stream;

  BehaviorSubject<List> _streamCategoria = BehaviorSubject<List>();
  Stream<List> get streamCategorias => _streamInfos.stream;

}

