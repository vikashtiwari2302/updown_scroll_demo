import '../constants/export.dart';

class TextView extends StatelessWidget {
  const TextView({
    Key? key,
    required this.text,
    this.fontSize: 15,
    // this.fontFamily: Fonts.poppinsRegular,
    this.textColor: AppColors.colorDefaultTextColor,
    this.fontWeight: FontWeight.normal,
    this.marginTop: 0,
    this.textOverflow,
    this.lineheight,
    this.textAlign,
    this.textDecoration,
    this.maxLine,
    this.overflow,
    this.softWrap,
  })  : assert(text != null),
        super(key: key);

  final TextDecoration? textDecoration;
  final int fontSize;
  final String text;
  // final String fontFamily;
  final Color textColor;
  final FontWeight? fontWeight;
  final double marginTop;
  final int? maxLine;
  final TextOverflow? textOverflow;
  final double? lineheight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final bool? softWrap;

  @override
  Widget build(BuildContext context) {
    /*ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);*/

    return Container(
      margin: EdgeInsets.only(top: marginTop),
      child: Text(
        text,
        textAlign: textAlign,
        overflow: textOverflow,
        maxLines: maxLine,
        softWrap: softWrap,
        style: TextStyle(
          decoration: textDecoration,
          height: lineheight,
          fontSize: fontSize.toDouble()/*ScreenUtil().setSp(fontSize * 2)*/,
          // fontFamily: fontFamily,
          fontWeight: fontWeight,
          color: textColor,
        ),
      ),
    );
  }
}
