import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';


class DebugScreenViewModel extends ChangeNotifier {
  void init() async {
    // Send a GET request to the website
    final response = await http.get(Uri.parse('https://www.spssecb.cz/aktuality'));

    if (response.statusCode == 200) {
      // Use the HTML parser to parse the HTML response
      final document = parse(response.body);

      // Select the elements with the class "news-block"
      final elements = document.querySelectorAll('.news-block');

      // Create an empty list to store the data
      final data = [];

      // Loop through the elements and extract the data
      for (var element in elements) {
        final title = element.querySelector('.news-title')?.text;
        final date = element.querySelector('.news-date')?.text;
        final content = element.querySelector('.news-text')?.text;

        // Create a map with the extracted data
        final news = {
          'title': title,
          'date': date,
          'content': content
        };

        // Add the map to the list
        data.add(news);
      }

      // Convert the list of maps to a JSON string
      final jsonString = jsonEncode(data);

      // Print the JSON string to the console
      print(jsonString);
    } else {
      print('Failed to load data');
    }
  }
}