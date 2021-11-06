import '../../../../core/constants/constants.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

/// Custom Drawer
class CustomDrawer extends StatelessWidget {
  /// Default Constructor
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerItem(
            icon: FontAwesomeIcons.github,
            onTap: () async {
              await canLaunch(kGithubLink)
                  ? await launch(kGithubLink)
                  : throw 'Could not launch $kGithubLink';
            },
            title: 'Github',
          ),
          const Divider(),
          DrawerItem(
            onTap: () async {
              await canLaunch(kLinkedinLink)
                  ? await launch(kLinkedinLink)
                  : throw 'Could not launch $kLinkedinLink';
            },
            title: 'Linkedin',
            icon: FontAwesomeIcons.linkedin,
          ),
          const Divider(),
          DrawerItem(
            onTap: () async {
              await canLaunch(kAppLink)
                  ? await launch(kAppLink)
                  : throw 'Could not launch $kAppLink';
            },
            title: 'Rate us',
            icon: FontAwesomeIcons.star,
          ),
          const Divider()
        ],
      ),
    );
  }
}

/// Single item in custom drawer menu
class DrawerItem extends StatelessWidget {
  /// Default constructor
  const DrawerItem({
    Key? key,
    required this.onTap,
    required this.title,
    required this.icon,
  }) : super(key: key);

  /// event when clicking on item
  final Function onTap;

  /// item title
  final String title;

  /// item icon
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
