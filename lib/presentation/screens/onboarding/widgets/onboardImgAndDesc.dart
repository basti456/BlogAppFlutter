part of 'widgets_import.dart';

class OnboardImgAndDesc extends StatelessWidget {
  final String imgPath;
  final String content;
  final double height;
  final double width;

  const OnboardImgAndDesc({
    super.key,
    required this.imgPath,
    required this.content,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imgPath,
          height: height,
          width: width,
        ),
        content.text
            .size(15.sp)
            .align(TextAlign.center)
            .fontWeight(FontWeight.w500)
            .make(),
      ],
    );
  }
}
