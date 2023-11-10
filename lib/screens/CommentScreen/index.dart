import 'package:dev_test/components/comment_tile.dart';
import 'package:flutter/material.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  bool isEmoticonsVisible = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    List<String> emoticons = [
      '🤣',
      '😀',
      '😂',
      '😃',
      '😄',
      '😅',
      '😆',
      '😉',
      '😊',
      '😋',
      '😎',
      '🥲',
      '😙',
      '😗',
      '🥰',
      '😘',
      '😍',
      '😚',
      '☺️',
      '🙂',
      '🤗',
      '🤩',
      '🤔',
      '🤨',
      '😐',
      '😑',
      '😶',
      '😥',
      '😣',
      '😏',
      '🙄',
      '😶‍🌫️',
      '🤐',
      '😯',
      '😪',
      '🥱',
      '😴',
    ];

    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            leadingWidth: 150,
            leading: Container(
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Row(children: [
                  CircleAvatar(
                      radius: 15,
                      backgroundColor: Color(0xFF90CAF9),
                      child: Icon(Icons.landscape,
                          color: Color(0xFF1565C0), size: 15)),
                  SizedBox(width: 10),
                  Text('SeeQuI'),
                  Icon(Icons.keyboard_arrow_right)
                ])),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search,
                      color: Color(0xFF959595), size: 25)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list,
                      color: Color(0xFF959595), size: 25)),
              const SizedBox(width: 30)
            ]),
        body: SingleChildScrollView(
            child: Stack(children: [
          !isEmoticonsVisible
              ? Positioned(
                  top: 100,
                  left: 27,
                  child: Container(
                      width: 2, height: 200, color: const Color(0xFF886826)),
                )
              : const SizedBox(),
          Column(children: [
            Row(children: [
              const SizedBox(width: 10),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: IconButton.styleFrom(
                      backgroundColor: Colors.black, padding: EdgeInsets.zero),
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.white, size: 30)),
              const SizedBox(width: 10),
              const Text('Reply', style: TextStyle(fontSize: 20))
            ]),
            const SizedBox(height: 30),
            !isEmoticonsVisible
                ? const CommentTile(
                    isReplying: true,
                    image: 'assets/images/comment_avatar_1.png',
                    userName: 'Kerry Johns',
                    userLink: '@Kerryjo',
                    timestamp: '3 hours ago',
                    comment:
                        'Lorem ipsum dolor sit amet consectetur. 😂🤣 Eget aenean integer amet sapien arcu urna turpis amet elementum. A nec euismod in quam venenatis.',
                    likes: '7k',
                    replies: 15)
                : Container(
                    width: screenWidth * .9,
                    height: screenHeight * .75,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(15)),
                          width: screenWidth * .65,
                          margin: const EdgeInsets.all(10),
                          child: const TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                                hintText: 'Search Emoji'),
                          )),
                      Container(
                        height: screenHeight * .65,
                        margin: const EdgeInsets.only(left: 30),
                        child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: emoticons.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    childAspectRatio: 1.25,
                                    crossAxisSpacing: 5),
                            itemBuilder: (BuildContext context, int index) =>
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        isEmoticonsVisible = false;
                                      });
                                    },
                                    child: Text(emoticons[index],
                                        style: const TextStyle(fontSize: 25)))),
                      )
                    ])),
            !isEmoticonsVisible
                ? Container(
                    height: 90,
                    margin: const EdgeInsets.all(10),
                    alignment: Alignment.bottomCenter,
                    child: Row(children: [
                      CircleAvatar(
                        backgroundImage:
                            Image.asset('assets/images/comment_avatar_3.png')
                                .image,
                      ),
                      Container(
                          width: screenWidth * .75,
                          margin: const EdgeInsets.all(10),
                          child: TextField(
                              decoration: InputDecoration(
                                  prefixIcon: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isEmoticonsVisible = true;
                                        });
                                      },
                                      child: const Icon(Icons.insert_emoticon)),
                                  hintText: 'Add Comment',
                                  suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.send,
                                          color: Colors.blue)),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))))))
                    ]))
                : const SizedBox()
          ])
        ])));
  }
}
