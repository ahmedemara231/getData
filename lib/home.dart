
import 'package:flutter/material.dart';
import 'package:untitled6/API/Model.dart';
import 'package:untitled6/API/Repository.dart';
import 'package:untitled6/mtText.dart';

class Home extends StatefulWidget {
   Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = true;
  late Model charData;
  late Model locationData;
  Repo repo = Repo();

  Future<void> getData()async
  {
    await repo.getCharacterData().then((value)
    {
      if(value.results.isEmpty)
        {
          print('empty');
        }
      else
      {
        charData = value;
        setState(() {
          isLoading = false;
        });
        //print(charData.results[0]);
        print(charData.results.length,);
      }
    });
    await repo.getLocationData().then((value)
    {
      if(value.results.isEmpty)
      {
        print('empty');
      }
      else
      {
        locationData = value;
        setState(() {
          isLoading = false;
        });
        print(locationData.results.length);
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading? const Center(child: Text('Loading...')) : GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: List.generate(
          locationData.results.length,
              (index) => Card(
            child: Column(
              children: [
                MyText(text: '${charData.results[index]['id']}',),
                MyText(text: '${charData.results[index]['name']}',),
                MyText(text: '${charData.results[index]['gender']}',),
                Expanded(child: Image.network('${charData.results[index]['image']}')),
                MyText(text: '${locationData.results[index]['dimension']}'),
                MaterialButton(
                  color: Colors.red,
                  onPressed: ()
                  {

                  },
                  child: MyText(text:'go to second page',color: Colors.white),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

