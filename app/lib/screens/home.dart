import 'package:flutter/material.dart';
import 'package:iitp/notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
  final _screenHeight = MediaQuery.of(context).size.height;
  final _screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Color(0xff2e424d) ,
        
        actions: [
        IconButton(onPressed: (){
          Navigator.pushReplacement<void, void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const NotifScreen(),
    ),
  );
        }, icon:const Icon(Icons.notifications)),
        
      ],
      
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left:25.0,right:25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Image.asset("assets/images/head.png")
                  ),
                  const Padding(
                    padding:  EdgeInsets.only(top:30.0,left: 10,bottom: 20),
                    child:  Text(
                      "ANNOUNCEMENTS:",
                      
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold
                        
                      ),
                  
                      ),
                  ),
                  Container(
                    padding:EdgeInsets.all(10) ,
                     height: 73,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xff2e424d),),
                      ),
                      child:const Text("From 10th May, only one bus will be running till 25th July.")
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  const SizedBox(
                    child:  Text("Available buses",
                    style: TextStyle(fontSize: 20,color:Color(0xff2e424d),fontWeight: FontWeight.bold ),
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  const SizedBox(
                    child:Text("Click on each bus card to track location")
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Container(
                    
                    height: 135,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                    color:Color(0xff2e424d) 
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      
                      children: [Text("BUS-1",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        
                        children: [
                          SizedBox(
                            width: 74,
                            height: 58,
                            child: Image.asset("assets/images/bus1.png",),
                            
                          ),
                          Column(
                            children:const [
                              Text("Bus no - BR 01PM 1423",style: TextStyle(color: Colors.white,)),
                              Text("Driver  -  Mr. Jitendra JI\n             (9263317071)",
                              style: TextStyle(color: Colors.white,))
                            ],
                          ),
                          IconButton(onPressed: (){}, icon:const Icon(Icons.keyboard_arrow_right,color: Colors.white,))
                        ],
                      ),
                      
                      
                      ],
                    ),
                    
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Container(
                    
                    height: 135,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                    color:Color(0xff2e424d) 
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      
                      children: [Text("BUS-2",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        
                        children: [
                          SizedBox(
                            width: 74,
                            height: 58,
                            child: Image.asset("assets/images/bus1.png",),
                            
                          ),
                          Column(
                            children:const [
                              Text("Bus no - BR 01PM 1423",style: TextStyle(color: Colors.white,)),
                              Text("Driver  -  Mr. Jitendra JI\n             (9263317071)",
                              style: TextStyle(color: Colors.white,))
                            ],
                          ),
                          IconButton(onPressed: (){}, icon:const Icon(Icons.keyboard_arrow_right,color: Colors.white,))
                        ],
                      ),
                      
                      
                      ],
                    ),
                    
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  const SizedBox(
                    width: 124,
                    height: 50,
                    child: Text("Guidelines:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    padding:EdgeInsets.all(10) ,
                     height: 260,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xff2e424d),),
                      ),
                      child:const Text('''1.Please arrive at the bus stop at least five minutes before departure. SWB will not be responsible if you arrive at the last minute and miss your bus.
2.When boarding the bus outside campus, keep your ID card handy or you will not be allowed on board.
3.Please avoid standing on the doors as it may lead to an accident.
4.Boarding buses elsewhere than at bus stops on campus is prohibited. We will take strict action against defaulters.
5.You may be banned from using bus services for up to 6 months if you make the bus wait at a stoppage for any reason.''')
                  ),
              ],
              
            ),
          ),
        )
        ),

    );
  }}