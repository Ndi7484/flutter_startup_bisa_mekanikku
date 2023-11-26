import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/providers/auth_provider.dart';
import 'package:flutter_mekanikku/providers/ui_settings_provider.dart';
import 'package:flutter_mekanikku/ui/profile_page.dart';
import 'package:flutter_mekanikku/ui/widgets/ads_widget.dart';
import 'package:flutter_mekanikku/ui/widgets/carousel.dart';
import 'package:flutter_mekanikku/ui/widgets/mechanic_list.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController scrollController = ScrollController();
  double offset = 0.0;
  // bool dark_mode = true;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  // Define a method to handle scroll events
  void _scrollListener() {
    setState(() {
      offset = scrollController.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provUi = Provider.of<UiSettingsProvider>(context);
    final authProv = Provider.of<AuthProvider>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 75,
        elevation: (offset > 10) ? 7 : 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Location',
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              FutureBuilder(
                future: provUi.getLocation(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return DropdownButton(
                      value: provUi.selectedValue,
                      onChanged: (value) {
                        setState(() {
                          provUi.selectedValue = value;
                        });
                      },
                      dropdownColor:
                          (offset > 10) ? Colors.white : Colors.black,
                      style: TextStyle(
                          color: (offset > 10) ? Colors.black : Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                      items: List.generate(
                        snapshot.data.length,
                        (index) => DropdownMenuItem(
                          value: snapshot.data[index].name,
                          child: Text(
                            snapshot.data[index].name,
                          ),
                        ),
                      ),
                      icon: Icon(
                        Icons.arrow_drop_down_rounded,
                        color: (offset > 10) ? Colors.grey : Colors.white,
                      ),
                      iconSize: 30,
                      // underline: const SizedBox(),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.star_border,
              color: Colors.grey,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            child: CircleAvatar(
              child: (authProv.loggedinUser != null)
                  ? Text(authProv.loggedinUser!.name.substring(0, 2))
                  : const Icon(Icons.person),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
        // backgroundColor: (offset > 10) ? Colors.white : Colors.transparent,
        backgroundColor:
            ColorTween(begin: Colors.transparent, end: Colors.white)
                .lerp(offset / 100),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5 + offset,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    (provUi.dark_mode)
                        ? Theme.of(context).colorScheme.secondary
                        : Colors.white,
                    (provUi.dark_mode)
                        ? Theme.of(context).colorScheme.primary
                        : Colors.white,
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.17),
                  const CarouselWidget(),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Our People",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const MechanicListWidget(),
                  const SizedBox(
                    height: 8,
                  ),
                  AdsBannerWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
