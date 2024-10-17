import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkDetector {
  // Function to detect links in a given text

  static List<String> detectLinks(String text) {
    // Regular expression to match URLs

    RegExp linkRegex = RegExp(
      r"(?:(?:https?|ftp):\/\/|www\.)[^\s/$.?#].[^\s]*",
      caseSensitive: false,
      multiLine: true,
    );

    // Find all matches in the text
    Iterable<Match> matches = linkRegex.allMatches(text);

    // Extract the links from the matches
    List<String> links = matches.map((match) => match.group(0)!).toList();

    return links;
  }

  // Function to wrap links in a highlight color
  static Widget highlightLinks(String text, var highlightColor, double textz,bool darkmode) {
    Color kala = Colors.white;
    bool eef = false;
    List<String> links = detectLinks(text);

    for (String link in links) {
      text = text.replaceAll(link, link);
      kala = highlightColor;
      eef = true;
    }
    void launchURL7(var url) async {
      // Replace with your desired link
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    String highlightedText = text;
    return InkWell(
      onTap: () {
        eef ? openFirstLink(highlightedText) : '';
      },
      child: RichText(
        text: TextSpan(
          text: !eef
              ? highlightedText
              : highlightedText.replaceAll(detectLinks(text).toString().replaceAll("[", "").replaceAll("]", ""), " ").replaceAll("test", ""),
          style: GoogleFonts.montserrat(
            fontSize: 19,
            color: darkmode?Colors.white:Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(
              text: eef
                  ? detectLinks(text).toString().replaceAll("[", "").replaceAll("]", "")
                  : "",
              style: GoogleFonts.roboto(
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    ); //;
  }

  // Function to open the first link found in the text
  static void openFirstLink(String text) {
    List<String> links = detectLinks(text);

    if (links.isNotEmpty) {
      launch(links[0]);
    }
  }
}
