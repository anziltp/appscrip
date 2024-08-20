import 'package:appscrip_task/constans/color_const.dart';
import 'package:appscrip_task/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class UserViewScreen extends StatefulWidget {
  final UserModel userModel;
  const UserViewScreen({super.key, required this.userModel});

  @override
  State<UserViewScreen> createState() => _UserViewScreenState();
}

class _UserViewScreenState extends State<UserViewScreen> {
  UserModel? user ;
  @override
  void initState() {

    user = widget.userModel;
    setState(() {

    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.teal,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
              child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        backgroundColor: ColorConst.primarycolor,
        ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Padding(
            padding:  EdgeInsets.all(w*0.03),
            child: Column(
              children: [
                Center(child: Stack(children:[ CircleAvatar(radius: w*0.15,backgroundColor: ColorConst.primarycolor,child: Icon(Icons.person,size: w*0.2,color: ColorConst.white,),)])),

            SizedBox(height: h*0.02,),
            Text(user!.name,style: TextStyle(fontWeight: FontWeight.w800,color: ColorConst.black,fontSize: w*0.08),),
            Text(user!.username,style: TextStyle(color: ColorConst.grey,fontWeight: FontWeight.w600,fontSize: w*0.05),),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(w*0.08),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                  Text("Email Address",style: TextStyle(color: ColorConst.grey,fontWeight: FontWeight.w800)),
                  Text(user!.email),
                    Divider(color: ColorConst.grey,)
                ],),
            SizedBox(height: h*0.02,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text("Mobile Number",style: TextStyle(color: ColorConst.grey,fontWeight: FontWeight.w800)),
                Text(user!.phone,style: TextStyle(fontWeight: FontWeight.w500)),
                Divider(color: ColorConst.grey,)
              ],),
                SizedBox(height: h*0.02,),
                Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text("Website",style: TextStyle(color: ColorConst.grey,fontWeight: FontWeight.w800)),
                Text(user!.website,style: TextStyle(fontWeight: FontWeight.w500)),
                Divider(color: ColorConst.grey,)
              ],),
                SizedBox(height: h*0.02,),
                Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text("Home Address",style: TextStyle(color: ColorConst.grey,fontWeight: FontWeight.w800),),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(user!.address.city,style: TextStyle(fontWeight: FontWeight.w500),),

                    Text(user!.address.street,style: TextStyle(fontWeight: FontWeight.w500),), ],),
                    Row(
                      children: [
                        Text(user!.address.suite,style: TextStyle(fontWeight: FontWeight.w500),),

                        Text(user!.address.zipcode,style: TextStyle(fontWeight: FontWeight.w500),)],

                    ),
                    Row(
                      children: [
                        Text(user!.address.geo.lat,style: TextStyle(fontWeight: FontWeight.w500),),
                        Text(user!.address.geo.lng,style: TextStyle(fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ],
                ),
                Divider(color: ColorConst.grey,)
              ],),
                SizedBox(height: h*0.02,),
                Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text("Office Address",style: TextStyle(color: ColorConst.grey,fontWeight: FontWeight.w800),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                        Text(user!.company.name,style: TextStyle(fontWeight: FontWeight.w500),),
                      Text(user!.company.catchPhrase,style: TextStyle(fontWeight: FontWeight.w500),),
                      Text(user!.company.bs,style: TextStyle(fontWeight: FontWeight.w500),)
                  ],
                ),
                Divider(color: ColorConst.grey,)
              ],),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
