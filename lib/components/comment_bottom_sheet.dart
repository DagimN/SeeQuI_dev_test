import 'package:dev_test/components/comment_tile.dart';
import 'package:flutter/material.dart';

class CommentBottomSheet extends StatelessWidget {
  const CommentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(children: [
          Container(
              width: 120,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(
                  color: Color(0xFF5F6368),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: const Text('45k Comments',
                  style: TextStyle(color: Colors.white))),
          SizedBox(
              height: screenHeight * .5,
              child: const SingleChildScrollView(
                  child: Column(children: [
                CommentTile(
                    image: 'assets/images/comment_avatar_1.png',
                    userName: 'Kerry Johns',
                    userLink: '@Kerryjo',
                    timestamp: '3 hours ago',
                    comment:
                        'Lorem ipsum dolor sit amet consectetur. 😂🤣 Eget aenean integer amet sapien arcu urna turpis amet elementum. A nec euismod in quam venenatis.',
                    likes: '7k',
                    replies: 15),
                CommentTile(
                    image: 'assets/images/comment_avatar_5.png',
                    userName: 'Kerry Johns',
                    userLink: '@Kerryjo',
                    timestamp: '3 hours ago',
                    comment:
                        'Lorem ipsum dolor sit amet consectetur. 😂🤣 Eget aenean ❤️❤️❤️',
                    likes: '7k',
                    replies: 0),
                CommentTile(
                    image: 'assets/images/comment_avatar_4.png',
                    userName: 'Kerry Johns',
                    userLink: '@Kerryjo',
                    timestamp: '3 hours ago',
                    comment:
                        'Lorem ipsum dolor sit amet consectetur. 😂🤣 Eget aenean integer amet sapien arcu urna turpis amet elementum. A nec euismod in quam venenatis.',
                    likes: '7k',
                    replies: 15),
                CommentTile(
                    image: 'assets/images/comment_avatar_2.png',
                    userName: 'Kerry Johns',
                    userLink: '@Kerryjo',
                    timestamp: '8 hours ago',
                    comment:
                        'Lorem ipsum dolor sit amet consectetur. 😂🤣 Eget aenean integer amet sapien arcu urna turpis amet elementum. A nec euismod in quam venenatis.',
                    likes: '7k',
                    replies: 15)
              ]))),
          Container(
              height: 111,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: const Color(0xFFC4C4C4))),
              alignment: Alignment.bottomCenter,
              child: Row(children: [
                CircleAvatar(
                  backgroundImage:
                      Image.asset('assets/images/comment_avatar_3.png').image,
                ),
                Container(
                    width: screenWidth * .8,
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.insert_emoticon),
                            hintText: 'Add Comment',
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon:
                                    const Icon(Icons.send, color: Colors.blue)),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))))))
              ]))
        ]));
  }
}
