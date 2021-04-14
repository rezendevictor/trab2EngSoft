import 'dart:math';

import 'package:pokecenter/bases/base.controller.dart';

class HomeController extends BaseController {


  List<String> reviews = [
    "Recomendo! Muito muito satisfeita após preenchimento e botox. (…) fui aconselhada por uma amiga que tinha feito harmonização facial com resultados muito bons.",
    "Ambiente super acolhedor. Equipa super simpática 🙂 Recomendo",
    " Recomendo, além de bons profissionais, têm bom atendimento. Obrigada.",
    "O Terapeuta Tiago foi uma preciosa ajuda para a minha Leonor. Só lamento não o ter conhecido mais cedo. Muito agradeço o profissionalismo e simpatia.",
"  Excelente profissional ! Fiz alguns procedimentos no rosto, foi super tranquilo e ninguém consegue ver a olho nú, se eu não contar ninguém sabe ",
    "Fiquei muito feliz por minha escolha - Dr. Newton (sem palavras)...",
    "Dr.Newton,  mãos abençoadas, educado, gentil, muito atencioso, adorei conhece.",
  ];

  String rand_say(){
    var rng = new Random();
    return reviews[rng.nextInt(4)];

  }


}
