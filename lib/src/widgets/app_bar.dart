import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
PreferredSize customAppbar({required String title}) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: AppBar(
          centerTitle: true,
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            
          ),
          title:  Text(title),
          titleTextStyle: GoogleFonts.urbanist(
            fontWeight: FontWeight.w500, color: Colors.black, fontSize: 25),
        ),
      ),
    );
  }
