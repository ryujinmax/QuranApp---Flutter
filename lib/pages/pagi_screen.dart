import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/pagi_model.dart';
import 'package:quran_app/viewmodel/pagi_viewmodel.dart';

class PagiScreen extends StatelessWidget {
  static const routeName = 'pagi_screen';
  const PagiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PagiViewModel _viewModel = PagiViewModel();
    return Scaffold(
      body: FutureBuilder(
          future: _viewModel.getListPagi(),
          builder: (context, snapshot) {
            return ListView.separated(
              itemBuilder: (context, index) => ItemList(
                context: context,
                pagi: snapshot.data!.elementAt(index),
              ),
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.withOpacity(0.1),
                height: 1,
              ),
              itemCount: snapshot.data != null ? snapshot.data!.length : 0,
            );
          }),
    );
  }

  Widget ItemList({required BuildContext context, required Pagi pagi}) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                pagi.title.toString(),
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                pagi.arabic.toString(),
                style: GoogleFonts.poppins(fontSize: 15, color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                pagi.translation.toString(),
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                pagi.notes.toString(),
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
