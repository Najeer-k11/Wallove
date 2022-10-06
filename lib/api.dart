import 'package:http/http.dart' as http;

class Api {
  getData() async {
    return await http.get(Uri.parse(
        'https://api.unsplash.com/photos/random?count=50&client_id=6znC7dHaurw-sApRAiFqPUDoGF7Iq7HyhMgVih-ep_I'));
  }
}

class ApiTopics {
  String topname;
  ApiTopics({required this.topname});

  getTopic() async {
    return await http.get(Uri.parse(
        'https://api.unsplash.com/topics/$topname/photos?&per_page=60&order_by=latest&client_id=6znC7dHaurw-sApRAiFqPUDoGF7Iq7HyhMgVih-ep_I&query=latest'));
  }
}
