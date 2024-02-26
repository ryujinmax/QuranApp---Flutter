import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/component/tab_item.dart';
import 'package:quran_app/model/surah_model.dart';
import 'package:quran_app/pages/tabs/doa.tab.dart';
import 'package:quran_app/pages/tabs/dzikir.tab.dart';
import 'package:quran_app/pages/tabs/surah_tab.dart';
import 'package:quran_app/theme.dart';
import 'dart:async';
// import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }
}

AppBar _appBar() => AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset('assets/svg/menu_icon.svg'),
      ),
      title: Text(
        'Quran App',
        style: GoogleFonts.poppins(
            fontSize: 18, fontWeight: FontWeight.w600, color: primary),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Future<void> _onSearch(BuildContext context) async {
                // Show search dialog
                final query = await showSearch<String>(
                  context: context,
                  delegate: SurahSearchDelegate(),
                );

                // Handle search results based on query
                if (query != null) {
                  // Update UI with filtered results
                }
              }
            },
            icon: SvgPicture.asset('assets/svg/search_icon.svg'))
      ],
    );

BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: [
        _bottomNavigationBarItem(
            icon: 'assets/svg/quran_icon.svg', label: 'Quran'),
        _bottomNavigationBarItem(icon: 'assets/svg/doa_icon.svg', label: 'Doa'),
        _bottomNavigationBarItem(
            icon: 'assets/svg/bookmark_icon.svg', label: 'Bookmark'),
      ],
    );

BottomNavigationBarItem _bottomNavigationBarItem(
        {required String icon, required String label}) =>
    BottomNavigationBarItem(
        // ignore: deprecated_member_use
        icon: SvgPicture.asset(icon, color: secondary),
        activeIcon: SvgPicture.asset(
          icon,
          // ignore: deprecated_member_use
          color: primary,
        ),
        label: label);

DefaultTabController _body() => DefaultTabController(
    length: 3,
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: _salam(),
            ),
            SliverAppBar(
              pinned: true,
              elevation: 0,
              automaticallyImplyLeading: false,
              shape: Border(
                  bottom: BorderSide(
                      width: 3, color: Colors.grey.withOpacity(0.1))),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: TabBar(
                    labelColor: primary,
                    indicatorColor: primary,
                    indicatorWeight: 3,
                    tabs: [
                      itemtab(label: "Surah"),
                      itemtab(label: "Dzikr"),
                      itemtab(label: "Doa"),
                    ],
                  )),
            )
          ],
          body: const TabBarView(children: [SurahTab(), DzikirTab(), DoaTab()]),
        )));

Column _salam() => Column(
      children: [
        Text(
          "Assalamualaikum",
          style: GoogleFonts.poppins(
              fontSize: 12, fontWeight: FontWeight.w600, color: secondary),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Azka',
          style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Stack(
          children: [
            Container(
              height: 131,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xffdf98fa), Color(0xff9055ff)])),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset('assets/svg/quran_banner.svg')),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/svg/book.svg'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Last Read",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Al-Fatihah",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  Text(
                    "Ayah No : 1",
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );

class SurahSearchDelegate extends SearchDelegate<String> {
  Future<List<Surah>> getListSurah() async {
    String data = await rootBundle.loadString('assets/data/list-surah.json');
    return surahFromJson(data);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Surah>>(
      future: getListSurah(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Text('Error loading surah data');
        } else if (snapshot.hasData) {
          final surahList = snapshot.data!;

          // Filter suggestions based on query
          final filteredList = surahList
              .where((surah) =>
                  surah.nama_latin.toLowerCase().contains(query.toLowerCase()))
              .toList();

          // Build suggestion widgets
          return ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (context, snapshot) {
              return ListTile(
                title: Text(filteredList[snapshot].nama_latin),
                onTap: () {
                  // Set selected surah and close search
                  query = filteredList[snapshot].nama_latin;
                  close(
                      context,
                      filteredList[snapshot]
                          as String); // Or navigate to surah details screen
                },
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          this.query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Surah>>(
      future: getListSurah(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Text('Error loading surah data');
        } else if (snapshot.hasData) {
          final surahList = snapshot.data!;

          // Filter suggestions based on query
          final filteredList = surahList
              .where((surah) =>
                  surah.nama_latin.toLowerCase().contains(query.toLowerCase()))
              .toList();

          // Build suggestion widgets
          return ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(filteredList[index].nama_latin),
                subtitle: Text(filteredList[index].arti),
                onTap: () {
                  // Set selected surah and close search
                  query = filteredList[index].nama_latin;
                  close(context, filteredList[index].nama_latin);
                  // Or navigate to surah details screen
                },
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
