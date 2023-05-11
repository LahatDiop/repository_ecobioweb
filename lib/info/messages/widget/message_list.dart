// import 'package:ecobio/messages/components/message.dart';
// import 'package:ecobio/messages/screens/message_dao.dart';

import '../components/message.dart';
import '../screens/message_dao.dart';

final messageDao = MessageDao();
bool _canSendMesssage = true;


void _sendMessage() {
 // if (_canSendMesssage()) {
    if (_canSendMesssage) {
    var _messageController;
    final message = Message(_messageController.text, DateTime.now());

    var widget;
    widget.messageDao.saveMessage(message);
    _messageController.clear();
   // setState(() {});
  }
}

//void setState(Null Function() param0) {}
