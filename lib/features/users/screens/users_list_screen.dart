import 'dart:convert';

import 'package:appscrip_task/constans/color_const.dart';
import 'package:appscrip_task/features/users/condroller/user_condroller.dart';
import 'package:appscrip_task/features/users/screens/user_view_screen.dart';
import 'package:appscrip_task/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;


import '../../../main.dart';

class FirstPage extends ConsumerStatefulWidget {
  const FirstPage({super.key});

  @override
  ConsumerState<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends ConsumerState<FirstPage> {


//
 final loading =false;
//
//
  
  TextEditingController searchController = TextEditingController();
// RefreshController refreshController=RefreshController(initialRefresh: true);
  @override



  Widget build(BuildContext context) {
    return RefreshIndicator(

      onRefresh: () async{
        Future.delayed(Duration(seconds: 3));
        ref.watch(userListProvider(searchController.text));

      },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: ColorConst.primarycolor,
            toolbarHeight: h * 0.2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(w * 0.1),
                  bottomRight: Radius.circular(w * 0.1)),
            ),
            title:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("AppScrip",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: ColorConst.white,
                      fontSize: w * 0.08,
                    )),
                SizedBox(height: h * 0.03),
                Center(
                    child: Container(
                  height: h * 0.07,
                  width: w * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w * 0.03),
                    color: ColorConst.white,
                  ),
                  child:Container(
                    width: w * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w * 0.04),
                      color: ColorConst.white,
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        // getUserList(value);
                        ref.watch(userListProvider(searchController.text));
                      },
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        suffixIcon: Icon(CupertinoIcons.search),
                        prefix: SizedBox(width: 10,),
                       // suffix: Icon(CupertinoIcons.search),
                        // suffixIcon: Padding(
                        //   padding: const EdgeInsets.all(10),
                        //   child: CircleAvatar(
                        //     backgroundColor: Colors.indigo,
                        //     child: Icon(CupertinoIcons.search,c),
                        //   ),
                        // ),
                        label: Padding(
                          padding:  EdgeInsets.all(w*0.04),
                          child: Text(
                            "Search...",
                            style: TextStyle(
                              color:ColorConst.primarycolor,
                              fontSize: w * 0.04,
                            ),
                          ),
                        ),
                        border: InputBorder.none,  // This removes the underline
                      ),
                    ),
                  )

                    ))
              ],
            )),
        body:loading?
        Center(child: CircularProgressIndicator()): SingleChildScrollView(
          child: Column(
            children: [

      SizedBox(
                height: w * 0.04,
              ),
              // RefreshIndicator(
              //   onRefresh: () {
              //     getUserList(searchController.text);0
              //     return getUserList(searchController.text);
              //   },
              //



              ref.watch(userListProvider(searchController.text)).when(data: (data) {
                return
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: data.length,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          //var user = userList[index];
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) =>
                                        UserViewScreen(userModel: data[index],),));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: w * 0.03, right: w * 0.03),
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircleAvatar(
                                        radius: w * 0.08,
                                        backgroundColor: ColorConst.primarycolor,
                                        child: Icon(
                                          Icons.person,
                                          color: ColorConst.white,
                                        ),
                                      ),
                                      SizedBox(width: w * 0.05,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text(
                                            "Name : ${data[index].name}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                color: ColorConst.black),
                                          ),
                                          Text(
                                            "Email : ${data[index].email}",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: ColorConst.black),
                                          )
                                        ],
                                      ),
                                      // Container(
                                      //     height: w*0.1,
                                      //   width: w*0.18,
                                      //
                                      //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(w*0.03),  color: Colors.indigo,),
                                      //   child: Center(child: Text("View",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.white),)),
                                      // )
                                      // SizedBox(width: w*0.05,),
                                      // Padding(
                                      //   padding: EdgeInsets.only(bottom: w * 0.06),
                                      //   child: Text("10 min"),
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                color: ColorConst.grey,
                                endIndent: w * 0.07,
                                indent: w * 0.06,
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: h * 0.03,
                          );
                        },

                      );
              },  error: (error, stackTrace) {
      return Text(error.toString());
      },
      loading: () {
          return Center(child: const CircularProgressIndicator());
        },),

            ],
          ),
        ),
      ),
    );
  }
}
