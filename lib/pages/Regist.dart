import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Regist extends StatefulWidget {
  const Regist({Key? key}) : super(key: key);

  @override
  _RegistState createState() => _RegistState();
}

class _RegistState extends State<Regist> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Time Table',
      style: optionStyle,
    ),
    Text(
      'Index 2: Attendance',
      style: optionStyle,
    ),
    Text(
      'Index 3: Assignments',
      style: optionStyle,
    ),
    Text(
      'Index 4: Profile',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  PanelController showCourse = PanelController();
  TextEditingController email = TextEditingController();
  bool prerequisite = false;
  List courseNames = ["Web Programming", "Math 4",   "Mobile Web Development", "HCI", "Operating Systems","Mobile Web Development", "HCI", "Operating Systems"];
  List lecturesNames = ["Web Programming", "Math 4", "Mobile Web Development", "HCI", "Operating Systems","Mobile Web Development", "HCI", "Operating Systems"];
  List sectionsNames = ["Web Programming", "Math 4", "Mobile Web Development", "HCI", "Operating Systems","ai7aga" , "ai7aga" ];
  List doctorname = ["DR Rasha Montaser", "DR Hala Farouk", "DR Mohamed Elkholy", "DR Nermine ElKashef", "DR Ahmed Younis","ai7aga" , "ai7aga" , "ai7aga" ];
  List time = ["3 Hours", "3 Hours", "2 Hours", "3 Hours", "3 Hours", "3 Hours" , "ai7aga" , "ai7aga" ];
  List pre = ["Prerequisite: OOP", "Prerequisite: Math 3", "Prerequisite: Operating Systems", "Prerequisite: None", "Prerequisite: None", "ai7aga" , "ai7aga" , "ai7aga" ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor:Color(0xff0b0b0b),
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        title: Text(
          'Registration',
          style: TextStyle(color:Colors.white),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(110.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.grey[800]
                    ),
                    width: MediaQuery.of(context).size.width*.8,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: 'Search ...',
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding: const EdgeInsets.only(left: 15.0),
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.notifications,
                    color: Colors.white,))
                ],
              ),
              SizedBox(height: 5,),
              TabBar(   indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xff3D649F),
                    width: 4.5,
                  ),
                ),
              ),
                controller: _tabController,
                labelColor: Colors.white,
                labelStyle: TextStyle(fontSize: 15),
                unselectedLabelColor: Color(0xffB2B2B2),
                tabs: [
                  Tab(text: 'Lectures'),
                  Tab(text: 'Sections'),
                ],
              )
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.separated(
            itemBuilder: (context, index) => ListTile(
              title: Text(lecturesNames[index]),
              subtitle: Text(doctorname[index]),
              trailing: Text(time[index]),
            ),
            separatorBuilder: (context, index) => Divider(),
            itemCount: lecturesNames.length,
          ),
          ListView.separated(
            itemBuilder: (context, index) => ListTile(
              title: Text(sectionsNames[index]),
              subtitle: Text(doctorname[index]),
              trailing: Text(time[index]),
            ),
            separatorBuilder: (context, index) => Divider(),
            itemCount: sectionsNames.length,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Time Table',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner_sharp),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Assignments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff3d649f),
        unselectedItemColor: Color(0xff777777),
        onTap: _onItemTapped,
      ),
    );
  }
}