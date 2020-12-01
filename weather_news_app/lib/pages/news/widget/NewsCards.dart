import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsCards extends StatelessWidget {
  final String newsTitle;
  final String newsDescription;
  final String newsImageUrl;

  NewsCards({this.newsImageUrl,this.newsTitle,this.newsDescription});
  @override
  Widget build(BuildContext context) {
    if(newsDescription != '' || newsImageUrl != '' || newsTitle != '')
      return
      Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),bottomLeft:  Radius.circular(6))
              ),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        imageUrl: newsImageUrl,
                        fit: BoxFit.cover,
                        height: 200,
                        width: MediaQuery.of(context).size.width,

                        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Image.network('https://via.placeholder.com/450x250'),
                      ),
                  ),
                  SizedBox(height: 12,),
                  Text(
                    newsTitle,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    newsDescription,
                    maxLines: 2,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  )
                ],
              ),
            ),
          ),
    );
    else{
      return Container(width: 0.0,height: 0.0,);
    }
  }
}
