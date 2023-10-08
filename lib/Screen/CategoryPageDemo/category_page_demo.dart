import 'package:ecommerceshope/Drawer/drawerdemo.dart';

import 'package:ecommerceshope/Drawer/enddrawer.dart';
import 'package:ecommerceshope/ProviderDemo/AddToCartProvider/adtocartprovider.dart';
import 'package:ecommerceshope/ProviderDemo/SubCategory/subcategory_provider.dart';
import 'package:ecommerceshope/ProviderDemo/addtocartProvider.dart';
import 'package:ecommerceshope/Screen/CategoryPageDemo/subcategory.dart';
import 'package:ecommerceshope/utils/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  // getCategoryDAta()async{
  //   try{
  //     var response=await http.get(Uri.parse(link));
  //     print(response.statusCode);
  //     if(response.statusCode==200){
  //       var categorydata=jsonDecode(response.body);
  //       Data data;
  //       for(var i in categorydata["data"]){
  //         data=Data.fromJson(i);
  //         categolylist.add(data);
  //       }
  //     }
  //   }catch(error){print("CategoryData error from api $error");}
  //   return categolylist;
  // }

  //
  // static fetchUsers() async {
  //   try {
  //     Response response = await Dio().get("https://bornonbd.com/api/category-with-subcategory");
  //     print(response.statusCode);
  //     if (response.statusCode == 200) {
  //       var getUsersData = response.data["data"] as List;
  //    var  listUsers = getUsersData.map((data) => Data.fromJson(data)).toList();
  //       print(listUsers);
  //       return listUsers;
  //     } else {
  //   throw Exception("‘Failed to load users’");
  //   }
  //   } catch (e) {
  //   print(e);
  //   }
  // }
  //  Future<dynamic>? listUsers;

  @override
  void initState() {
    // listUsers= fetchUsers();
    Provider.of<Sub_Category_Provider>(context, listen: false).getCategories(context,);
    super.initState();
  }

  int? id;
  int? categoryIndex = 0;
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final allDataList = Provider.of<Sub_Category_Provider>(context).allproductlist;
    final cat = Provider.of<Sub_Category_Provider>(context);

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: Provider.of<Sub_Category_Provider>(context, listen: false).getCategories(context,),
          builder: (context, snapshot) {
          if(snapshot.hasData){
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 180,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10
              ),
              itemCount: allDataList.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        categoryIndex = index;
                      });

                      if (categoryIndex == index) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubCategoryPageDemo(
                                subCategoryindex: index,
                                categoryname: "${allDataList[index].name}",
                                product: allDataList[index].product!,
                              ),
                            ));
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 0, top:0, right: 0),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Expanded(
                              child : ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(10)
                                ),
                                child: CustomImage(
                                  width: double.infinity,
                                  path: "http://bornonbd.com/uploads/category/original/${allDataList[index].image}",
                                  fit: BoxFit.cover,
                                ),
                              )
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "${allDataList[index].name}",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          else if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            return const SizedBox();
          }
        },)
      ),
    );
  }
}

//
// child: FutureBuilder (
// future: listUsers,
// builder: (context, snapshot) {
// if (snapshot.hasData) {
//
// return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// mainAxisExtent: 300,
// crossAxisCount: 2),
// itemCount: (snapshot.data.length),
// itemBuilder: (context, index) {
// var user = (snapshot.data as List<Data>)[index];
// return Card(
// elevation: 9,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(15),
// ),
// child: InkWell(
// onTap: () {
// setState(() {
// categoryindex=index;
// });
// if(categoryindex==index){
// Navigator.push(context, MaterialPageRoute(builder: (context) => SubCategoryPageDemo(
//
// subCategoryindex: index,
//
// ),));
// }
//
//
// },
// child: Container(
// padding: EdgeInsets.only(left: 5,right: 5),
//
// width: double.infinity,
// child: Column(
// children: [
// Expanded(
// flex: 7,
// child: Card(
// child: Container(
// height: double.infinity,
// width: double.infinity,
// decoration: BoxDecoration(
// color: Colors.black54,
// borderRadius: BorderRadius.circular(15),
// image: DecorationImage(image: NetworkImage( "http://bornonbd.com/uploads/category/original/${user.image}",),fit: BoxFit.fill),
// ),
// alignment: Alignment.topRight,
// child:Stack(
// children: [
// //  CircleAvatar(backgroundColor: Colors.red,radius: 20,child: Text("${alldatalist[index].discount}"),),
// CircleAvatar(backgroundColor: Colors.red,radius: 20,child: Text("25%"),),
// ],
// )
// ),
// ),
// ),
// Container(
// // height: double.infinity,
// // width: double.infinity,
// //  color: Colors.red[900],
// padding: EdgeInsets.only(
// left: 5, right: 5, top: 5
// ),
// alignment: Alignment.center,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container( width: double.infinity,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("${user.name}",style: TextStyle(
// fontSize: 12,
// fontWeight: FontWeight.w400
// ),),
// Text("${user.details}",style: TextStyle(
// fontSize: 10,
// fontWeight: FontWeight.w400
// ),) ,
// ],
// ),
// ),
// Container(
// height: 30,
// width: double.infinity,
// //     color: Colors.blue,
// alignment: Alignment.center,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Text("৳ ${user.id}",style: TextStyle(fontSize: 12),),
// SizedBox(width: 10,),
// //    Text("\$ ${user.status}",style: TextStyle(fontSize: 12)),
// IconButton(onPressed: () {
//
// }, icon: Icon(Icons.favorite,size: 11,)),
// ],
// ),
// ),
// ],
// ),
// )
// ],
// ),
// ),
// ),
// );
// },);
// // return ListView.separated(
// //     itemBuilder: (context, index) {
// //       var user = (snapshot.data as List<Data>)[index];
// //       return Container(
// //         padding: EdgeInsets.only(left: 20,right: 20),
// //         height: 250,
// //         width: double.infinity,
// //         child: Column(
// //           children: [
// //             Expanded(
// //               flex: 7,
// //               child: Card(
// //                 child: Container(
// //                     height: double.infinity,
// //                     width: double.infinity,
// //                     decoration: BoxDecoration(
// //                       color: Colors.black54,
// //                       image: DecorationImage(image: NetworkImage( "http://bornonbd.com/uploads/category/original/${user.image}",),fit: BoxFit.fill),
// //                     ),
// //                     alignment: Alignment.topRight,
// //                     child:Stack(
// //                       children: [
// //                         //  CircleAvatar(backgroundColor: Colors.red,radius: 20,child: Text("${alldatalist[index].discount}"),),
// //                         CircleAvatar(backgroundColor: Colors.red,radius: 20,child: Text("25%"),),
// //                       ],
// //                     )
// //                 ),
// //               ),
// //             ),
// //             Container(
// //               // height: double.infinity,
// //               // width: double.infinity,
// //               //  color: Colors.red[900],
// //               padding: EdgeInsets.only(
// //                   left: 5, right: 5, top: 5
// //               ),
// //               alignment: Alignment.center,
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Container( width: double.infinity,
// //                     child: Column(
// //                       mainAxisAlignment: MainAxisAlignment.start,
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Text("${user.name}",style: TextStyle(
// //                             fontSize: 12,
// //                             fontWeight: FontWeight.w400
// //                         ),),
// //                         Text("${user.details}",style: TextStyle(
// //                             fontSize: 10,
// //                             fontWeight: FontWeight.w400
// //                         ),) ,
// //                       ],
// //                     ),
// //                   ),
// //                   Container(
// //                     height: 25,
// //                     width: double.infinity,
// //                     //     color: Colors.blue,
// //                     alignment: Alignment.center,
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       crossAxisAlignment: CrossAxisAlignment.center,
// //                       children: [
// //                         Text("৳ ${user.id}",style: TextStyle(fontSize: 12),),
// //                         SizedBox(width: 10,),
// //                         //    Text("\$ ${user.status}",style: TextStyle(fontSize: 12)),
// //                         IconButton(onPressed: () {
// //
// //                         }, icon: Icon(Icons.favorite,size: 11,)),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             )
// //           ],
// //         ),
// //       );
// //     },
// //     separatorBuilder: (context, index) {
// //       return Divider();
// //     },
// //     itemCount: (snapshot.data as List<Data>).length);
//
//
//
//
// } else if (snapshot.hasError) {
// return Center( child: Text("${snapshot.error}"));
// }
// return Center(
// child: CircularProgressIndicator(backgroundColor: Colors.cyanAccent),
// );
// },
// ),
