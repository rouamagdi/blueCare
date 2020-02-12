import 'package:flutter/material.dart';
import 'package:loginn/models/messages.dart';

class MyMessageChatTile extends StatelessWidget {
  final double minValue = 8.0;
  final Message message;
  final bool isCurrentUser;

  MyMessageChatTile({this.message, this.isCurrentUser});
  @override
  Widget build(BuildContext context) {
    final cap = Theme.of(context).textTheme.subhead.apply(color: Colors.white);
    final tit =
        Theme.of(context).textTheme.caption.apply(color: Colors.white54);
    final borderColor = Colors.transparent;

    return Column(
      crossAxisAlignment:
          isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: isCurrentUser
              ? EdgeInsets.only(right: 0.0, bottom: minValue * 2, left: 70.0)
              : EdgeInsets.only(right: 70.0, bottom: minValue * 2, left: 0.0),
          padding: EdgeInsets.all(minValue),
          height: 55.0,
          decoration: BoxDecoration(
              color: isCurrentUser ? Color(0xFF304D6D) : Colors.grey,
              borderRadius: isCurrentUser
                  ? BorderRadius.only(
                      topLeft: Radius.circular(minValue * 4),
                      bottomLeft: Radius.circular(minValue * 4),
                      topRight: Radius.circular(minValue * 4))
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(minValue * 4),
                      topRight: Radius.circular(minValue * 4))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: isCurrentUser
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Text(
                  "${message.messageBody}",
                  style: cap,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
