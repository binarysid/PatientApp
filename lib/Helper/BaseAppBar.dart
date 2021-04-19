import 'package:flutter/material.dart';


class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final String title;
  final AppBar appBar;
  Icon icon = Icon(Icons.search);
  Function onPressIcon = (){};
  BaseAppBar({Key key, this.title, this.backgroundColor, this.appBar,this.icon,this.onPressIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.1,
      backgroundColor: this.backgroundColor,
      title: Text(this.title),
      actions: <Widget>[
        IconButton(
          disabledColor: Colors.white,
          icon: Icon(Icons.search),
          onPressed: onPressIcon,
        )
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}