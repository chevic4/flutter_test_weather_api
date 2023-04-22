import 'package:flutter/material.dart';

class TownNameWidget extends StatelessWidget {
  final String nameTown;
  const TownNameWidget({
    Key? key,
    required this.nameTown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 14),
      child: Text(
        nameTown,
        maxLines: 2,
        overflow: TextOverflow.fade,
        style: TextStyle(
            fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize),
      ),
    );
  }
}
