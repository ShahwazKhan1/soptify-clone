import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/themes/app_colors.dart';
import 'package:spotify/presentation/home/widgets/news_songs.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../core/configs/assets/app_vectors.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  BasicAppBar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeTopCart(),
            _tabs(),
            SizedBox(
              height: 260,
              child: TabBarView(
                  controller: _tabController,
                  children: const [
                    NewsSongs(),
                    Center(
                      child: Text('Videos Not Found🎬',style:
                        TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 16
                        ),),
                    ),
                    Center(
                      child: Text('Artist Not Found😢',style:
                      TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 16
                      ),),
                    ),
                    Center(
                      child: Text('Podcast Not Available🤷‍♂️',style:
                      TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 16
                      ),),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }

  Widget _homeTopCart(){
    return Center(
      child: SizedBox(
        height: 140,
        child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(AppVectors.homeTopCart)),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 45),
                    child: Image.asset(AppImages.homeArtist),
                  ))
            ]
        ),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      controller: _tabController,
      // isScrollable: true,
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      indicatorColor: AppColors.primary,
      padding: const EdgeInsets.symmetric(
          vertical: 30,
      ),
      tabs: const [
        Text(
          'News',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 10
          ),
        ),
        Text(
          'Videos',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 10
          ),
        ),
        Text(
          'Artists',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 10
          ),
        ),
        Text(
          'Podcasts',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 10
          ),
        )
      ],
    );
  }
}