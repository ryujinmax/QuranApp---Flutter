import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/pages/pagi_screen.dart';
import 'package:quran_app/pages/petang_screen.dart';
import 'package:quran_app/pages/sholat_screen.dart';

class DzikirTab extends StatelessWidget {
  const DzikirTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, PagiScreen.routeName);
                  },
                  child: Text(
                    "Dzikir Pagi",
                    style: GoogleFonts.poppins(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                width: double.infinity,
                height: 95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xffdf98fa), Color(0xff9055ff)]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, PetangScreen.routeName);
                  },
                  child: Text(
                    "Dzikir Petang",
                    style: GoogleFonts.poppins(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                width: double.infinity,
                height: 95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xffdf98fa), Color(0xff9055ff)]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, SholatScreen.routeName);
                  },
                  child: Text(
                    "Dzikir Sholat",
                    style: GoogleFonts.poppins(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                width: double.infinity,
                height: 95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xffdf98fa), Color(0xff9055ff)]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
