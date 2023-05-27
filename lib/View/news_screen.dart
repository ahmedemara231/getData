import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:untitled6/API/Repository.dart';
import 'package:untitled6/News_api/model.dart';
import 'package:untitled6/News_api/repo.dart';
import 'package:untitled6/mtText.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  bool isLoading= true;
  Repo2 repo2 = Repo2();
  late Model2 newsModel;
  
  Future<void> getNewsData() async 
  {
    await repo2.getNews().then((value)
      {
        if(value.status == 'ok')
          {
            log('not empty');
            newsModel = value;
            log('${newsModel.totalResults}');
            log('${newsModel.articles[0]['publishedAt']}');
          }
        else
        {
          log('empty');
        }
      },
    );
    setState(() {
      isLoading = false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // title: MyText(text: '${newsModel.totalResults}'),
      ),
      body: isLoading? Center(child: MyText(text: 'Loading')) : Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
                newsModel.articles.length,
                    (index) => Column(
                      children: [
                        Card(
                          child: ListTile(
                            leading: Image.network('${newsModel.articles[index]['urlToImage']}'),
                            title: MyText(text: '${newsModel.articles[index]['title']}'),
                            trailing: MyText(text: '${newsModel.articles[index]['author']}',fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 15,)
                      ],
                    )),
          ),
        ),
      ) 
    );
  }
}


// [0] , [1] , ...etc ==> thats Wrong
// [index] this can represent all indexes in list ==> thats true

