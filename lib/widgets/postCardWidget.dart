import 'package:employee_forums_task/providers/likedPostProvider.dart';
import 'package:employee_forums_task/providers/savedPostProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:employee_forums_task/providers/postProvider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final likedPostsProvider = Provider.of<LikedPostsProvider>(context);
    final savedPostsProvider = Provider.of<SavedPostsProvider>(context);
    final isSaved = savedPostsProvider.savedPostIds.contains(post.id);
    final isLiked = likedPostsProvider.likedPostIds.contains(post.id);

    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      child: Column(
        children: [
          const Divider(thickness: 1.0),
          Row(
            children: [
              CircleAvatar(
                radius: 16.0,
                backgroundImage: NetworkImage(
                    "https://s3-alpha-sig.figma.com/img/a57f/7188/c5c7aa2da965020d4f85fee632bb0bc2?Expires=1716768000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LaR2Y49G3PxRvrs1VxfTcegUldTJeQ1ksv-nYDrr8W-6t7i4dpkXhf-wZdJfiGfJBUg4IZdTiui3YrqS-wA3F346DgQwtAfX82tf5pfVsYj-QZNvR-VAapyvA80yq2qTb2Ub1gOVdcleBJZG78-YWtbvHStVwYDw4JG8-5KogHEVRwtB~ZuaRlN96RdPGQa~4DBx4McDrESrdzl1DJ0uZP39FRZwyQiTEKFnZiivP0SyBGj6yLwMWwr3WkaiDRI3MRRRI82dGXT57ywMuaY6iSJlmv5l2x0AQAvfCyvk5dumkAkrCRnPRg3ZKrnvJOzNolbKVn08A6AYQM1e5eaCCQ__"),
              ),
              SizedBox(
                width: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    post.description,
                    style: TextStyle(
                        fontSize: 8.5,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Spacer(),
              PopupMenuButton(
                icon: FaIcon(FontAwesomeIcons.ellipsis),
                onSelected: (value) {
                  if (value == 'save') {
                    savedPostsProvider.toggleSavePost(post);
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'save',
                    child: Row(
                      children: [
                        Icon(
                          isSaved ? Icons.bookmark : Icons.bookmark_outline,
                          color: isSaved ? Colors.blue : null,
                        ),
                        SizedBox(width: 8),
                        Text(isSaved ? 'Unsave' : 'Save'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              post.image,
              fit: BoxFit.cover,
              height: 180.0,
            ),
          ),
          SizedBox(height: 8.0),
          Consumer<PostProvider>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  Text(
                    provider.showFullText
                        ? post.eventDescription
                        : post.eventDescription,
                    maxLines: provider.showFullText ? null : 35,
                    overflow: TextOverflow.ellipsis,
                  ),
                  GestureDetector(
                    onTap: () {
                      provider.toggleShowFullText();
                    },
                    child: Text(
                      provider.showFullText ? "see more" : "see less",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  likedPostsProvider.toggleLikePost(post);
                },
                icon: isLiked
                    ? Icon(Icons.thumb_up)
                    : Icon(Icons.thumb_up_outlined),
              ),
              Text(
                isLiked ? '1 Likes' : '0 Likes',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.comment_outlined),
              ),
              Text(
                "Comment",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.share),
              ),
              Text(
                "Share",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
