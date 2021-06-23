import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patientapp/Helper/Cache.dart';
import 'package:patientapp/Helper/CommonServices.dart';
import 'package:patientapp/Helper/CommonUtils.dart';
import 'package:patientapp/Helper/CommonViews.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patientapp/Model/UserData.dart';
import 'package:patientapp/Presenter/ProfilePresenter.dart';
import 'package:patientapp/Router/ProfileRouter.dart';

class Profile extends StatefulWidget {
  @override
  ProfileController createState() => ProfileController();
}

class ProfileController extends State<Profile> {
  static const double top = 6;
  static const double left = 20;
  static const double right = 20;
  static const double bottom = 12;
  static const double offsetTop = 14;
  static const String nameHint = 'name';
  static const String phoneHint = 'phone';
  static const String emailHint = 'email';
  var presenter = ProfilePresenter();
  var router = ProfileRouter();
  var name = '';
  var phone = '';
  var email = '';
  UserData data;
  final addressController = TextEditingController();
  LocationData selectedLocation;
  File _image;
  final picker = ImagePicker();
  dynamic avatarImage = Image(image: UIComponent.defaultAvatar,);
  bool logoUpdated = false;
  Loader loader = Loader(false);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: BaseAppBar(title:UIComponent.hospitalTitle,appBar:AppBar()),
      body: SafeArea(
        child: FutureBuilder(
          initialData: null,
          future: Cache.getUserData(),
          builder: (context,snapshot){
            if(snapshot.data!=null) {
              this.data = snapshot.data;
              this.addressController.text = this.data.address;
              if(this.data.photo!=null) {
                this.avatarImage =
                    this.presenter.getProfileImage(this.data.photo);
              }
              return profileView();
            }
            return Text('');
          }
      )
      ),
    );
  }

  Widget profileView() {
    return CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child:Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0,0 ,50),
                child: Stack(
                  children: <Widget>[
                    profileImageBuilder(),
                    Positioned(bottom: 1, right: 1 ,child: Container(
                        height: 40, width: 40,
                        child:
                        GestureDetector(child:
                        Icon(Icons.add_a_photo, color: Colors.white,
                        ),onTap: (){
                          this.showImageOptions();
                        },),
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                      )),
                  ],
                ),
              ),
              loader,
              Expanded(child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)]
                    )
                ),
                child: Column(
                  children: <Widget>[
                    nameView(),
                    phoneView(),
                    emailView(),
                    addressView(),
                    saveBtn()
                  ],
                ),
              ))
            ],
        )
          )
        ]
    );
  }
  Expanded saveBtn()=>Expanded(
      child: Align(
        alignment: Alignment.bottomRight,
        child: InkWell(
          child: Container( height: 70, width: 200,
            child: Align(child: Text('Save', style: TextStyle(color: Colors.white70, fontSize: 20),),),
            decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),)
            ),
          ),
          onTap: (){
              loader.showLoader();
              this.presenter.updateInfo(name, this.data.id, email,
                  this.selectedLocation, _image, data, logoUpdated).then((value) =>
              {
                loader.hideLoader(),
                this.logoUpdated = false,
                CommonToast.showToastForAsyncRequest(value)
              });
          },
        ),
      ),
  );
  Padding nameView()=>Padding(
      padding: const EdgeInsets.fromLTRB(left, top+offsetTop, right, 0),
      child: TextFormEditable(hintText: nameHint,initialText:this.data.name,onTextChange: (value){
        this.name = value;
      },validator: (value){

      },
      )
  );
  Padding phoneView()=>Padding(
    padding: const EdgeInsets.fromLTRB(left, top, right, 0),
    child: TextFormEditable(hintText: phoneHint,initialText:this.data.phone,isEnable: false,
    ),
  );
  Padding emailView()=>Padding(
    padding: const EdgeInsets.fromLTRB(left, top, right, 0),
    child: TextFormEditable(hintText: emailHint,initialText:this.data.email,onTextChange: (value){
      this.email = value;
    },validator: (value){

    },
    ),
  );
  Padding addressView()=>Padding(
    padding: const EdgeInsets.fromLTRB(left, top, right, bottom),
    child: TextFormWithAction(
        hintText: 'select address',
        editController: addressController,
        validator: (value){
          return value;
        },
        onPress: () async {
          var location = await this.router.fetchLocation(context);
          addressController.text = location.address;
          this.selectedLocation = location;
        }),
  );
}

extension on ProfileController{
  GestureDetector profileImage()=>GestureDetector(
      onTap: (){
        this.showImageOptions();
      },
      child: CircleAvatar(
        radius: 70,
        child: ClipOval(child: avatarImage,),
      ),
  );
  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      this.presenter.setProfileImage(_image);
      this.logoUpdated = true;
    }
    else{
      print('No image selected.');
    }

  }
  showImageOptions(){
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: new Icon(Icons.photo_library),
                title: new Text('Gallery'),
                onTap: () {
                  this.getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.photo_camera),
                title: new Text('Camera'),
                onTap: () {
                  this.getImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
  StreamBuilder profileImageBuilder()=>StreamBuilder( // Wrap our widget with a StreamBuilder
      stream: this.presenter.getProfilePic, // pass our Stream getter here
      initialData: this.avatarImage, // provide an initial data
      builder: (context, snapshot){
        this.avatarImage = snapshot.data;
        return profileImage();
      }
    // access the data in our Stream here
  );
}
