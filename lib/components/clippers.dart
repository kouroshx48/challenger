import 'package:flutter/material.dart';

//class profile screen clipper
class ProfileClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * .25, size.height * .5, size.width * 0.5,
        size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.75, size.height, size.width, size.height * 0.5);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MissionClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.quadraticBezierTo(
      size.width * .2,
      size.height * .3,
      size.width * .5,
      size.height * .2,
    );
    path.cubicTo(size.width * .50, size.height * .1, size.width * .5,
        size.height * .6, size.width * .8, size.height * .5);
    path.quadraticBezierTo(
        size.width * .9, size.height * 1, size.width, size.height * .8);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class SkillClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final h = size.height;
    final w = size.width;
    path.lineTo(0, h * .3);
    path.quadraticBezierTo(w * 1/6, h * .25, w * 2/6 - 25, h * .5);
    path.quadraticBezierTo(w * 3/6 , h , w * 4/6 + 25, h * .5);
    path.quadraticBezierTo(w * 5/6, h * .25, w, h * .3);
    path.lineTo(w, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class QuestClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    final h = size.height;
    final w = size.width;
    path.lineTo(0, 7);
    path.quadraticBezierTo(w * .25/6, h * 1/3, w * 2/6 + 15, h * 1/3);
    path.quadraticBezierTo(w * 1/2, h, w * 4/6 - 15, h * 1/3);
    path.quadraticBezierTo(w * 5.75/6, h * 1/3, w , 7);
    path.lineTo(w, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}