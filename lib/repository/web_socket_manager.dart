import 'package:web_socket_channel/io.dart';

var token = "UkSqhWIFNR5ToNy";
const app_id = 1089;

class WebSocketManager {
  late final IOWebSocketChannel _channel;

  WebSocketManager() {
    _channel = IOWebSocketChannel.connect(
      Uri.parse('wss://ws.binaryws.com/websockets/v3?app_id=$app_id'),
      pingInterval: const Duration(seconds: 10),
    );
    _channel.stream.listen(invokeReadDataFromSocket);
  }

  invokeWriteDataOnSocket(String request) {
    // if(_channel.){

    // }
    _channel.sink.add(request);
  }

  invokeReadDataFromSocket(dynamic response) {}
}
