import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/surah_model.dart';
import 'package:quran_app/pages/detail_screen.dart';
import 'package:quran_app/theme.dart';
import 'package:quran_app/viewmodel/surah_viewmodel.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  @override
  Widget build(BuildContext context) {
    final SurahViewModel _viewModel = SurahViewModel();
    return FutureBuilder<List<Surah>>(
        future: _viewModel.getListSurah(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Tidak ada data"),
            );
          }

          return ListView.separated(
              itemBuilder: (context, index) => _itemList(
                    context: context,
                    surah: snapshot.data!.elementAt(index),
                  ),
              separatorBuilder: (context, index) => Divider(
                    color: Colors.grey.withOpacity(0.1),
                    height: 1,
                  ),
              itemCount: snapshot.data!.length);
        });
  }

  Widget _itemList({required BuildContext context, required Surah surah}) =>
      InkWell(
          onTap: () {
            Navigator.pushNamed(context, DetailScreen.routeName,
                arguments: surah.nomor.toString());
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Stack(
                  children: [
                    SvgPicture.asset('assets/svg/nomor_surah.svg'),
                    SizedBox(
                      height: 36,
                      width: 36,
                      child: Center(
                        child: Text(
                          surah.nomor.toString(),
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, color: primary),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        surah.nama_latin,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16),
                      ),
                      Text(
                        surah.tempat_turun,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Text(
                  surah.nama,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      fontSize: 18),
                ),
              ],
            ),
          ));
}
