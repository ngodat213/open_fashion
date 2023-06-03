class Blog {
  final List<String> types;
  final String thumb;
  final List<String> imagePaths;
  final String title;
  final List<String> texts;
  final int timePost;
  final String userPost;
  final bool? isFav = false;

  Blog(
    this.types,
    this.thumb,
    this.imagePaths,
    this.title,
    this.texts,
    this.timePost,
    this.userPost,
    isFav,
  );
}
