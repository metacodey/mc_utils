// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class McText extends StatelessWidget {
  final double? fontSize;
  final Color? color;
  final bool blod;
  final int? line;
  final String? fontFamily;
  final TextAlign? txtAlign;
  final bool show5Words;
  final String txt;
  const McText({
    Key? key,
    this.fontSize,
    this.color,
    this.blod = false,
    this.line,
    this.fontFamily,
    this.txtAlign,
    this.show5Words = false,
    required this.txt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // استخراج أول 5 كلمات من النص
    List<String> words = txt.split(' ');
    String truncatedTxt =
        words.length > 5 ? words.sublist(0, 5).join(' ') + '...' : txt;

    return Text(
      show5Words ? truncatedTxt : txt,
      maxLines: line,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      textAlign: txtAlign,
      style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontFamily: fontFamily,
          overflow: TextOverflow.ellipsis,
          fontWeight: blod ? FontWeight.bold : null),
    );
  }
}
