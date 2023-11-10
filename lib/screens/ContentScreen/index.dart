import 'package:dev_test/components/comment_bottom_sheet.dart';
import 'package:dev_test/components/custom_drawer.dart';
import 'package:dev_test/config/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  int navIndex = 0;
  bool isHidden = false;
  bool isContentExpanded = false;
  bool isDrawerVisible = false;
  String textContent =
      'Lorem ipsum dolor sit amet consectetur. Eget aenean integer amet sapien arcu urna turpis amet elementum. A nec euismod in quam venenatis. Consectetur et nunc amet mattis dui imperdiet tempus. Et aliquet gravida posuere pretium donec diam nibh sed. Pharetra non vitae urna aliquet egestas. Phasellus at id adipiscing eget. Lorem volutpat dolor lorem pharetra nunc duis lorem integer. Magna in pellentesque pretium elementum suspendisse tincidunt fermentum praesent.';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        extendBody: true,
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
        body: Stack(children: [
          Image.asset('assets/images/sample_image.png',
              height: screenHeight, fit: BoxFit.cover),
          !isHidden
              ? Positioned(
                  bottom: 120,
                  right: 1,
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(children: [
                        CircleAvatar(
                            radius: 15,
                            backgroundImage:
                                Image.asset('assets/images/avatar.png').image),
                        const SizedBox(height: 10),
                        Image.asset(AppIcons.referenceWhite,
                            fit: BoxFit.cover, width: 25),
                        const SizedBox(height: 10),
                        InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  constraints: BoxConstraints(
                                      maxHeight: screenHeight * .7),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const CommentBottomSheet();
                                  });
                            },
                            child: Column(children: [
                              Image.asset(AppIcons.comment,
                                  fit: BoxFit.cover, width: 25),
                              const Text('45k',
                                  style: TextStyle(color: Colors.white))
                            ])),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            Image.asset(AppIcons.like,
                                fit: BoxFit.cover, width: 25),
                            const Text('45k',
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                        const SizedBox(height: 10),
                        Image.asset(AppIcons.share,
                            fit: BoxFit.cover, width: 25),
                        const SizedBox(height: 10)
                      ])))
              : const SizedBox(),
          isDrawerVisible ? const CustomDrawer() : const SizedBox(),
          !isHidden
              ? Positioned(
                  child: IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          isDrawerVisible = !isDrawerVisible;
                        });
                      }))
              : const SizedBox(),
          !isHidden
              ? Positioned(
                  right: 1,
                  bottom: 90,
                  child: TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {
                      setState(() {
                        isHidden = !isHidden;
                      });
                    },
                    child: Container(
                      width: 55,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Color(0xBB675726),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30))),
                      child: Image.asset(AppIcons.toggleHide),
                    ),
                  ))
              : Positioned(
                  left: -5,
                  bottom: 90,
                  child: TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {
                      setState(() {
                        isHidden = !isHidden;
                      });
                    },
                    child: Container(
                      width: 55,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Color(0xBB675726),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Transform.rotate(
                          angle: 160.3,
                          child: Image.asset(AppIcons.toggleHide)),
                    ),
                  )),
          !isHidden
              ? Positioned(
                  bottom: 65,
                  child: Container(
                      height: isContentExpanded ? 270 : 150,
                      width: screenWidth * .80,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: const Color(0xFFC4C4C4)),
                          color: const Color(0x88423C3C),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: isContentExpanded ? 200 : 90,
                              child: Text(textContent,
                                  softWrap: true,
                                  maxLines: isContentExpanded ? 15 : 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('27 Oct. 2020 @5:23pm',
                                      style:
                                          TextStyle(color: Color(0xFFE5A5A5))),
                                  if (textContent.length > 150)
                                    SizedBox(
                                        width: 75,
                                        height: 30,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                backgroundColor:
                                                    const Color(0xFF34302F)),
                                            onPressed: () {
                                              setState(() {
                                                isContentExpanded =
                                                    !isContentExpanded;
                                              });
                                            },
                                            child: !isContentExpanded
                                                ? Row(children: [
                                                    const Text('...More',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF2CCAA0))),
                                                    Image.asset(AppIcons.more)
                                                  ])
                                                : Row(children: [
                                                    const Text('...Less',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF2CCAA0))),
                                                    Image.asset(AppIcons.less)
                                                  ])))
                                ])
                          ])))
              : const SizedBox()
        ]),
        bottomNavigationBar: !isHidden
            ? NavigationBar(
                height: 65,
                backgroundColor: const Color(0xFF2E2E2E),
                destinations: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            navIndex = 0;
                          });
                        },
                        child: Column(children: [
                          SvgPicture.asset(AppIcons.apps,
                              // ignore: deprecated_member_use
                              color: navIndex == 0
                                  ? const Color(0xFFFFDD5E)
                                  : Colors.white),
                          const SizedBox(height: 5),
                          Text('Apps',
                              style: TextStyle(
                                  color: navIndex == 0
                                      ? const Color(0xFFFFDD5E)
                                      : Colors.white,
                                  fontSize: 10))
                        ])),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            navIndex = 1;
                          });
                        },
                        child: Column(children: [
                          SvgPicture.asset(AppIcons.qucon,
                              // ignore: deprecated_member_use
                              color: navIndex == 1
                                  ? const Color(0xFFFFDD5E)
                                  : Colors.white),
                          const SizedBox(height: 5),
                          Text('Qucon',
                              style: TextStyle(
                                  color: navIndex == 1
                                      ? const Color(0xFFFFDD5E)
                                      : Colors.white,
                                  fontSize: 10))
                        ])),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            navIndex = 2;
                          });
                        },
                        child: Column(children: [
                          SvgPicture.asset(AppIcons.zaady,
                              // ignore: deprecated_member_use
                              color: navIndex == 2
                                  ? const Color(0xFFFFDD5E)
                                  : Colors.white),
                          const SizedBox(height: 5),
                          Text('Zaady',
                              style: TextStyle(
                                  color: navIndex == 2
                                      ? const Color(0xFFFFDD5E)
                                      : Colors.white,
                                  fontSize: 10))
                        ])),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            navIndex = 3;
                          });
                        },
                        child: Column(children: [
                          SvgPicture.asset(AppIcons.organize,
                              // ignore: deprecated_member_use
                              color: navIndex == 3
                                  ? const Color(0xFFFFDD5E)
                                  : Colors.white),
                          const SizedBox(height: 5),
                          Text('Organize',
                              style: TextStyle(
                                  color: navIndex == 3
                                      ? const Color(0xFFFFDD5E)
                                      : Colors.white,
                                  fontSize: 10))
                        ])),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            navIndex = 4;
                          });
                        },
                        child: Column(children: [
                          SvgPicture.asset(AppIcons.profile,
                              // ignore: deprecated_member_use
                              color: navIndex == 4
                                  ? const Color(0xFFFFDD5E)
                                  : Colors.white),
                          const SizedBox(height: 5),
                          Text('Profile',
                              style: TextStyle(
                                  color: navIndex == 4
                                      ? const Color(0xFFFFDD5E)
                                      : Colors.white,
                                  fontSize: 10))
                        ]))
                  ])
            : const SizedBox());
  }
}
