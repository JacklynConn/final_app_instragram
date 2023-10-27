class PostModel {
  int postId;
  int userIdFK;
  String caption, audioTitle;
  bool isLiked, isTagged;
  String image, artistimage;
  double likeCount, totalComments, totalshare;

  PostModel({
    required this.postId,
    required this.userIdFK,
    this.caption = "no-title",
    this.audioTitle = "no-audiotitle",
    this.totalshare = 0,
    this.likeCount = 0,
    this.totalComments = 0,
    required this.isLiked,
    required this.isTagged,
    this.artistimage= "no-image",
    this.image = "no-image",
  });
}
