import 'package:dev_test/config/path.dart';
import 'package:flutter/material.dart';

import '../screens/CommentScreen/index.dart';

class CommentTile extends StatelessWidget {
  final String image;
  final String userName;
  final String userLink;
  final String timestamp;
  final String comment;
  final String likes;
  final int replies;
  final bool isReplying;

  const CommentTile(
      {super.key,
      required this.image,
      required this.userName,
      required this.userLink,
      required this.timestamp,
      required this.comment,
      required this.likes,
      required this.replies,
      this.isReplying = false});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        margin: const EdgeInsets.all(10),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CircleAvatar(backgroundImage: Image.asset(image).image),
          const SizedBox(width: 10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Row(children: [
                Text(userName, style: const TextStyle(fontSize: 11)),
                const SizedBox(width: 10),
                InkWell(
                    child: Text(userLink,
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 11)))
              ]),
              const SizedBox(width: 30),
              Text(timestamp,
                  style: const TextStyle(fontSize: 11, color: Colors.grey))
            ]),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: screenWidth * .75,
              child: Text(
                comment,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
            !isReplying
                ? Row(children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CommentScreen()));
                        },
                        child: Row(children: [
                          Image.asset(AppIcons.reply),
                          const SizedBox(width: 5),
                          Text(replies != 0 ? replies.toString() : '')
                        ])),
                    const SizedBox(width: 20),
                    Row(children: [
                      Image.asset(AppIcons.commentLike),
                      const SizedBox(width: 5),
                      Text(likes)
                    ]),
                    const SizedBox(width: 20),
                    Image.asset(AppIcons.flag),
                  ])
                : const Row(children: [
                    Text('Replying to',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 4),
                    Text('John Doe @JohntheD',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFCC40)))
                  ]),
            replies != 0 && !isReplying
                ? Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFE6E6E6)),
                    child: Row(children: [
                      Text('View $replies replies',
                          style: const TextStyle(color: Colors.grey)),
                      const Icon(Icons.keyboard_arrow_right,
                          color: Color(0xFFBD6565))
                    ]))
                : const SizedBox()
          ])
        ]));
  }
}
