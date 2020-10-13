import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

final List<String> imgList = [
  'https://cdn.unitycms.io/image/ocroped/2001,2000,1000,1000,0,0/95oyqVwZg-0/9Cfc6EgYqNuABfwBjSfsXm.jpg',
  'https://image.freepik.com/free-vector/cartoon-brain-idea-creative-design_24877-14830.jpg',
  'https://cdn.wallapop.com/images/10420/8s/pw/__/c10420p531967499/i1564931090.jpg?pictureSize=W640',
  'https://blog.stockcrowd.com/hubfs/captacion-de-fondos-para-fundaciones.jpg',
  'https://pbs.twimg.com/media/ETxpBPJXkAA9qIV.jpg:large',
  'https://www.lifeder.com/wp-content/uploads/2018/10/question-mark-2123967_640.jpg',
  'https://us.123rf.com/450wm/abluecup/abluecup1407/abluecup140700477/30348266-una-se%C3%B1al-de-tr%C3%A1fico-con-una-buena-elecci%C3%B3n-de-malas-palabras-bien-escogidas-sobre-fondo-de-cielo.jpg?ver=6',
  'https://conceptodefinicion.de/wp-content/uploads/2016/04/Elecci%C3%B3n.jpg',
  'https://image.freepik.com/vector-gratis/business-target-team-work-puzzle-estilo-dibujos-animados-plana_44695-178.jpg',
  'https://pbs.twimg.com/media/EhAtpR7WAAM2NXt.png',
  'https://pbs.twimg.com/media/C-h9qoXU0AAjX-V.jpg',
  'https://recursos.bancobase.com/hubfs/Blog_Julio_16/29_JULIO_NUEVOS_MODELOS_DE_NEGOCIO_ADAPTADOS_AL_CLIENTE_2.jpg',
];

final List<String> textLessons = [
  'Encuentra el socio correcto',
  'Imagina que tienes la idea de abrir una ensambladora de computadores porque eres muy bueno en ello y como la mayoría de los emprendedores quieres encontrar un socio',
  'Las personas que tienes en mente son: Juanpa tu amigo del alma quien también tiene mucho talento para armar pcs, sin embargo, nunca se ha involucrado en la creación de un negocio',
  'Por otro lado, está tu amiga Ana, ella no tiene experiencia armando pcs, pero ha trabajado desde muy pequeña vendiendo computadores en la tienda de su papá y cuenta con muy buenos contactos',
  'Y la última persona es tu primo Rubén, quien no tiene experiencia armando pcs ni en ventas, pero tiene mucha energía para aprender y te ha  dicho que el cree que puede ser buen comerciante y que pondrá todo de su parte.',
  '¿Cuál de ellos escogerías? ',
  'La mejor elección seria Ana, la experiencia que tiene vendiendo y sus conexiones son el mejor complemento para ti.',
  'Las habilidades de Juanpa no aportan mucho y aunque Rubén tiene mucha energía, no tiene ninguna habilidad remarcable a comparación de los demás.',
  'En cambio, haciendo equipo con Ana puedes compartir la carga de trabajo, darte feedback y desarrollar nuevas ideas',
  'Para encontrar el socio correcto, haz una lista de los candidatos potenciales y hazte las siguientes preguntas',
  '¿Es alguien en el que confías? ¿El estilo de trabajo es compatible con la tuyo? ¿Tienen los mismos objetivos con el negocio? ¿Su compromiso con el negocio es tan fuerte como el tuyo?',
  '¿Y está dispuesto a poner todo por escrito? La confianza es fundamental, pero es importante dejar acuerdos textuales, por ello ten presente: hablar de cómo será la distribución de ganancias y cómo se utilizarán los fondos, para evitar inconvenientes en el futuro.'
];

class Slides extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SlidesState();
  }
}

class _SlidesState extends State<Slides> {
  int _current = 0;

  void onPlayAudio() async {
    AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      //Audio("assets/audios/$_current.mp3"),
      Audio("assets/audios/0.mp3"),
    );
  }

  List<Widget> _getSliders() {
    return imgList
        .map(
          (item) => SingleChildScrollView(
            child: Container(
              //height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(32.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(),
                      IconButton(
                        icon: Icon(Icons.hearing),
                        onPressed: onPlayAudio,
                        iconSize: 30.0,
                      ),
                    ],
                  ),
                  Container(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover),
                        SizedBox(
                          height: 32.0,
                        ),
                        Center(
                          child: Text(
                            textLessons[_current],
                            style: TextStyle(
                              color: Colors.blueGrey.shade900,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 32.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map((url) {
                int index = imgList.indexOf(url);
                return Container(
                  width: 14.0,
                  height: 14.0,
                  margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Colors.yellow.shade600
                        : Colors.white,
                  ),
                );
              }).toList(),
            ),
            CarouselSlider(
              items: _getSliders(),
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  height: MediaQuery.of(context).size.height * 0.7,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
          ]),
    );
  }
}
