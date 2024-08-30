part of 'home_imports.dart';

@RoutePage()
class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key, required this.post});

  final Post post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: post.title!.text.size(16.sp).ellipsis.make(),
      ),
      body: ListView(
        children: [
          CachedNetworkImage(
            imageUrl: post.featuredimage!,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                10.h.heightBox,
                post.title!.text.bold.xl2.make(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(FeatherIcons.eye),
                    8.w.widthBox,
                    "${post.views!.toString()} views".text.make(),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FeatherIcons.thumbsUp,
                          color: Colors.green,
                        )),
                    post.like == null ? "0".text.make() : post.like.text.make(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FeatherIcons.thumbsDown,
                          color: Colors.red,
                        )),
                    post.dislike == null ? "0".text.make() : post.dislike.text.make(),
                  ],
                ),
                HtmlWidget(post.body!)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
