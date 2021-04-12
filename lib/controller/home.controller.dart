import 'dart:math';

import 'package:pokecenter/bases/base.controller.dart';

class HomeController extends BaseController {


  List<String> reviews = [
    "Recomendo! Muito muito satisfeita após preenchimento e botox. (…) fui aconselhada por uma amiga que tinha feito harmonização facial com resultados muito bons. O Dr. Heartfild é um verdadeiro profissional, dedicado e super simpático. Tratamento personalizado, com resposta a todas as dúvidas por telefone durante o tratamento o que me deu muita tranquilidade, (…) Clínica super acolhedora e atendimento top.",
    "Ambiente super acolhedor. Equipa super simpática 🙂 Recomendo",
    " Recomendo, além de bons profissionais, têm bom atendimento. Obrigada.",
    "O Terapeuta Tiago foi uma preciosa ajuda para a minha Leonor. Só lamento não o ter conhecido mais cedo. Muito agradeço o profissionalismo e simpatia."
  ];

  String rand_say(){
    var rng = new Random();
    return reviews[rng.nextInt(4)];

  }


}
