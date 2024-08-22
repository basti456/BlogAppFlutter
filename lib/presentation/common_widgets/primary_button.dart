part of 'common_widgets_imports.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool? isLoading;

  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: BlogColors.splashScreenColor,
        minimumSize: Size(MediaQuery.of(context).size.width, 44.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.r),
        ),
      ),
      child: isLoading == true
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : title.text
              .size(16.sp)
              .fontWeight(FontWeight.w700)
              .color(Colors.white)
              .make(),
    );
  }
}
