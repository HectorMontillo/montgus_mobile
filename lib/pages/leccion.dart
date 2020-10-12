import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
//initial commit devDavila (new branch)

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


final List<Widget> imageSliders = imgList.map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: Stack(
        children: <Widget>[
          Image.network(item, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                '${textLessons[imgList.indexOf(item)]}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      )
    ),
  ),
)).toList();

class Slides extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<Slides> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((url) {
              int index = imgList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 70.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
              height: 600.0,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }
            ),
            ),
          //new TextForLessons()
          /*
          new Text(
            "dak",
              style: new TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.green[900],
                  fontSize: 16.0
              ),
          )*/
        ]
      ),
    );
  }
}

class TextForLessons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300.0,
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: true, //solo se deberia activar cuando se active el audio
        autoPlayInterval: Duration(seconds: 3)
        ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.white),
                child: Text(
                  'texto $i',
                  style: TextStyle(fontSize: 16.0),
                ));
          },
        );
      }).toList(),
    );
  }
  

}

//statelesswidget is for static widgets, change this?
class Slidess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 600.0,
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: true, //solo se deberia activar cuando se active el audio
        autoPlayInterval: Duration(seconds: 3)
        ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.white),
                child: Text(
                  'texto $i',
                  style: TextStyle(fontSize: 16.0),
                ));
          },
        );
      }).toList(),
    );
  }
}
