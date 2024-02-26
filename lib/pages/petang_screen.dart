import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/sore_model.dart';
import 'package:quran_app/viewmodel/petang_viewmodel.dart';

class PetangScreen extends StatelessWidget {
  static const routeName = 'sore_screen';
  const PetangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PetangViewModel _viewModel = PetangViewModel();
    return Scaffold(
      body: FutureBuilder(
          future: _viewModel.getListPagi(),
          builder: (context, snapshot) {
            return ListView.separated(
              itemBuilder: (context, index) => ItemList(
                context: context,
                petang: snapshot.data!.elementAt(index),
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

  Widget ItemList({required BuildContext context, required Petang petang}) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                petang.title.toString(),
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                petang.arabic.toString(),
                style: GoogleFonts.poppins(fontSize: 15, color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                petang.translation.toString(),
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                petang.notes.toString(),
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
