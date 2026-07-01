import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Transport',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarThemeData(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.yellow,
          centerTitle: true,
          toolbarHeight: 80.5,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: Colors.yellow,
          ),
        ),
      ),
      home: CityBusPlovdiv(),
    );
  }
}

class CityBusPlovdiv extends StatefulWidget {
  const CityBusPlovdiv({super.key});

  @override
  State<CityBusPlovdiv> createState() => _CityBusPlovdivState();
}

final class _CityBusPlovdivState extends State<CityBusPlovdiv> {
  static const String _title = 'Live Transport';
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    String url = dotenv.env['MAP_URL'] ?? '';

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Icon(Icons.bus_alert_outlined, size: 30.0),
            const SizedBox(height: 10.0),
            const Text(_title),
          ],
        ),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
