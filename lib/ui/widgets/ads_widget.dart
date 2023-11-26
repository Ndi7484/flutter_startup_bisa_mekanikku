import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/models/ads_state.dart';
import 'package:flutter_mekanikku/providers/ads_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AdsBannerWidget extends StatelessWidget {
  AdsBannerWidget({super.key});
  bool alreadyAd = false;
  Ad? AD;

  @override
  Widget build(BuildContext context) {
    final provAds = Provider.of<AdsProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Card(
          child: FutureBuilder<AdsState>(
        future: provAds.loadApiAds(),
        builder: (context, snapshot) {
          if (snapshot.hasData && !alreadyAd) {
            alreadyAd = !alreadyAd;
            AD = snapshot.data?.ad;
          }
          // the ads is looping callback with connection waiting
          // use this to call once if nothing circular() but try build Container first
          try {
            // return the same
            return GestureDetector(
              onTap: () async {
                var url = AD!.redirectToUrl;
                if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url));
                } else {
                  print('Could not launch $url');
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: Color(
                        int.parse(
                          AD!.accent.replaceAll('#', '0xff'),
                        ),
                      )),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(9.5),
                          topRight: Radius.circular(9.5),
                        ),
                        child: Stack(
                          children: [
                            Image.network(AD!.imageUrl),
                            Container(
                                decoration:
                                    BoxDecoration(color: Colors.grey[300]),
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Text(
                                    'Ads Content',
                                    style: TextStyle(
                                        color: Colors.grey[500], fontSize: 11),
                                  ),
                                )),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                      child: Text(
                        AD!.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        (AD!.content)
                            .replaceAll('<div>', '')
                            .replaceAll('</div>', '')
                            .replaceAll('<br>', '\n'),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } catch (e) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.4,
                  16,
                  MediaQuery.of(context).size.width * 0.4,
                  16),
              child: const CircularProgressIndicator(),
            );
          }
        },
      )),
    );
  }
}
