import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';  

void main() {
  runApp(const QuotesApp());
}

class QuotesApp extends StatelessWidget {
  const QuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Quotes Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuotesHomePage(),
    );
  }
}

class QuotesHomePage extends StatefulWidget {
  const QuotesHomePage({super.key});

  @override
  State<QuotesHomePage> createState() => _QuotesHomePageState();
}

class _QuotesHomePageState extends State<QuotesHomePage> {
  String _quote = "Fetching quote...";
  String _author = "";
  bool _isLoading = false;

  // Base API URL
  final String _apiUrl = "http://192.168.18.111:3001/quotes/getQuotes";

  @override
  void initState() {
    super.initState();
    fetchQuote();
  }

  Future<void> fetchQuote() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse(_apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        // Picking a random quote from the list
        final randomQuote = (data..shuffle()).first;

        setState(() {
          _quote = randomQuote['quote'] ?? "No quote available";
          _author = randomQuote['author'] ?? "Unknown";
        });
      } else {
        setState(() {
          _quote = "Failed to fetch quote. Status: ${response.statusCode}";
          _author = "";
        });
      }
    } catch (e) {
      setState(() {
        _quote = "Error fetching quote: $e";
        _author = "";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  
  void shareQuote() {
    final String shareText = '"$_quote"\n- $_author';
    Share.share(shareText);  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Center(child: Text('Random Quotes Generator')),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _isLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      children: [
                        Text(
                          _quote,
                          style: const TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "- $_author",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: fetchQuote,
                child: const Text("New Quote"),
              ),
              const SizedBox(height: 16),
              IconButton(color: Colors.black, onPressed: shareQuote, icon: const Icon(Icons.share)),
              ElevatedButton(
                onPressed: shareQuote,
                child: const Text("Share Quote"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}