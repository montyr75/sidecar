import 'package:flutter/material.dart';

class PanelList extends StatefulWidget {
  final List<ExpandableItem> items;

  const PanelList({Key? key, required this.items}) : super(key: key);

  @override
  State<PanelList> createState() => _PanelListState();
}

class _PanelListState extends State<PanelList> {
  List<ExpandableItem> get items => widget.items;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expandedHeaderPadding: const EdgeInsets.all(0),
      expansionCallback: (i, isExpanded) {
        setState(() {
          items[i].toggle();
        });
      },
      children: [
        for (int i = 0; i < items.length; i++)
          ExpansionPanel(
            headerBuilder: items[i].headerBuilder,
            body: items[i].bodyBuilder(context, items[i].isExpanded),
            isExpanded: items[i].isExpanded,
          ),
      ],
    );
  }
}

class ExpandableItem<T> {
  final ExpansionPanelHeaderBuilder headerBuilder;
  final ExpansionPanelHeaderBuilder bodyBuilder;
  final T? data;
  bool isExpanded;

  ExpandableItem({
    required this.headerBuilder,
    required this.bodyBuilder,
    this.data,
    this.isExpanded = false,
  });

  void toggle() => isExpanded = !isExpanded;

  bool get hasData => data != null;
}
