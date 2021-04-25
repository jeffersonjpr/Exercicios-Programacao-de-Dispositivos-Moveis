import 'package:flutter/cupertino.dart';

class Brasao extends StatelessWidget {
  final String image;
  final double width;

  const Brasao({Key key, this.image, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag:
            image, //tag tem que ser a mesa, daí o flutter reconhece as duas e faz a animação
        child: Image.network(
          image,
          fit: BoxFit.contain, //imagem fica contida dentro do sizedBox
        ),
      ),
    );
  }
}
