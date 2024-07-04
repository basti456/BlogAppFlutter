part of 'common_widgets_imports.dart';

class PrimaryButton extends StatelessWidget {
  final PageRouteInfo<dynamic> pageRouteInfo;
  final String title;

  const PrimaryButton({
    super.key,
    required this.pageRouteInfo,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        AutoRouter.of(context).push(pageRouteInfo);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: BlogColors.splashScreenColor,
        minimumSize: Size(MediaQuery.of(context).size.width, 44.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.r),
        ),
      ),
      child: title.text
          .size(16.sp)
          .fontWeight(FontWeight.w700)
          .color(Colors.white)
          .make(),
    );
  }
}
