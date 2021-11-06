import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// widget that expand and collapse on click
class ExpandableWidget extends StatelessWidget {
  /// constructor
  const ExpandableWidget(
      {Key? key,
      required this.header,
      required this.collapsed,
      required this.expanded})
      : super(key: key);

  /// title or widget header
  final String header;

  /// collapsed widget
  final Widget collapsed;

  /// expanded widget
  final Widget expanded;
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                  tapBodyToExpand: true,
                ),
                header: Text(
                  header,
                  style: GoogleFonts.mcLaren(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                collapsed: collapsed,
                expanded: expanded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
