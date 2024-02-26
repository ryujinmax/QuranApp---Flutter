import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/doa_model.dart';
import 'package:quran_app/viewmodel/doa_viewmodel.dart';

class DoaTab extends StatelessWidget {
  const DoaTab({super.key});

  @override
  Widget build(BuildContext context) {
    final DoaViewModel _viewModel = DoaViewModel();
    return FutureBuilder(
      future: _viewModel.getListDoa(),
      builder: (context, snapshot) {
        return ListView.separated(
          itemBuilder: (context, index) => ItemList(
            context: context,
            doa: snapshot.data!.elementAt(index),
          ),
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey.withOpacity(0.1),
            height: 1,
          ),
          itemCount: snapshot.data != null ? snapshot.data!.length : 0,
        );
      },
    );
  }

  Widget ItemList({required BuildContext context, required DailyDoa doa}) {
     return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  doa.title.toString(),
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  doa.arabic.toString(),
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  doa.translation.toString(),
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.black),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
