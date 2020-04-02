import 'package:cached_network_image/cached_network_image.dart';
import 'package:dynamic_theming_provider/utils/shimmer.dart';
import 'package:flutter/material.dart';

class ImgPage extends StatefulWidget {
  @override
  _ImgPageState createState() => _ImgPageState();
}



class _ImgPageState extends State<ImgPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: CachedNetworkImage(
              imageUrl: "https://www.elsetge.cat/myimg/f/54-546627_grand-theft-auto-v-los-santos-4k-gta.jpg",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                  ),
                ),
              ),
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white,
                child: Container(
                  height: 290,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
