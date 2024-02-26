import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/dzikir_model.dart';
import 'package:quran_app/viewmodel/sholat_viewmodel.dart';

class SholatScreen extends StatelessWidget {
  static const routeName = 'sholat_screen';
  const SholatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SholatViewModel _viewModel = SholatViewModel();
    return Scaffold(
      body: FutureBuilder(
          future: _viewModel.getListSholat(),
          builder: (context, snapshot) {
            return ListView.separated(
              itemBuilder: (context, index) => ItemList(
                context: context,
                dzikir: snapshot.data!.elementAt(index),
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

  Widget ItemList({required BuildContext context, required Dzikir dzikir}) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                dzikir.title.toString(),
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                dzikir.arabic.toString(),
                style: GoogleFonts.poppins(fontSize: 15, color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                dzikir.translation.toString(),
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                dzikir.notes.toString(),
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
