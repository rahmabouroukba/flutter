import 'package:flutter/material.dart';

class sustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget icon2;
  final Widget iconmenu;
  const sustomAppBar({Key? key, required this.icon2, required this.iconmenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Autres demandes',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontStyle: FontStyle.italic,
          shadows: [
            Shadow(
              color: Colors.blue,
              blurRadius: 3,
              offset: Offset(1, 1),
            ),
          ],
          fontFamily: 'Niticia Text',
        ),
      ),
      leading: iconmenu,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon2,
            const SizedBox(width: 10),
          ],
        )
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 133, 187, 231),
          Color.fromARGB(255, 96, 164, 219),
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
      ),
      bottom: TabBar(
        tabs: [
          Tab(
            icon: Icon(
              Icons.construction,
              color: Colors.blue,
            ),
            child: Text(
              "Client Industriel",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          Tab(
            icon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            child: Text(
              'Client Residentiel',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushNamed(context, 'rep');
          } else if (index == 1) {
            Navigator.pushNamed(context, 'rem');
          }
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
