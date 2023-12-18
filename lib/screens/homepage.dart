import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<bool> isSelected;

  @override
  void initState() {
    super.initState();
    // Initialize the list of selected states with false values
    isSelected = List.generate(2, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poultry Farm Management'),
      ),
      drawer: Drawer(
        child: ListView(
          padding:  EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(child: Text("Shop",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                // Handle dashboard tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Farmers'),
              onTap: () {
                // Handle farmers tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.insert_chart),
              title: const Text('Reports'),
              onTap: () {
                // Handle reports tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle settings tap
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          ToggleButtons(
            isSelected: isSelected,
            onPressed: (int index) {
              setState(() {
                // Update the selected states when a button is pressed
                for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                  isSelected[buttonIndex] = buttonIndex == index;
                }
              });
            },
            color: Colors.black,
            selectedColor: Colors.white,
            fillColor: isSelected[1] ? Colors.red : Colors.green,
            borderColor: isSelected[1] ? Colors.red : Colors.green,
            selectedBorderColor: isSelected[1] ? Colors.red : Colors.green,
            borderRadius: BorderRadius.circular(20.0), // Rounded corners
            children: [
              Container(
                padding: const EdgeInsets.all(12.0), // Adjust the padding as needed
                child: const Text(
                  'Entry List',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), // Added bold style
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12.0), // Adjust the padding as needed
                child: const Text(
                  'Non-Entry List',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), // Adjust the font size as needed
                ),
              ),
            ],
          ),
          if (isSelected[0]) // Display only if "Entry List" is selected
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 8.0, 60.0, 8.0), // Adjusted padding for 'Producer'
                        child: Text(
                          'Producer',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0), // Adjusted padding for 'Production'
                        child: Text(
                          'Production',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildProducerRow('Vamsi', true), // Bold
                    _buildProductionRow(300),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildProducerRow('Gopi', true), // Bold
                    _buildProductionRow(320),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildProducerRow('Sai', true), // Bold
                    _buildProductionRow(310),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildProducerRow('Ganesh', true), // Bold
                    _buildProductionRow(350),
                  ],
                ),
              ],
            ),
          if (isSelected[1]) // Display only if "Non-Entry List" is selected
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(23.0,8.0,8.0,8.0),
                        child: Text(
                          'Producer',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.0,8.0,40.0,8.0),
                        child: Text(
                          'Phone',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildProducerRowWithPhone('Kalyan'),
                    _buildProductionRowWithPhone('9876543210'),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildProducerRowWithPhone('Pavan'),
                    _buildProductionRowWithPhone('9876543211'),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildProducerRowWithPhone('Gopi'),
                    _buildProductionRowWithPhone('9876543212'),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildProducerRowWithPhone('Vamsi'),
                    _buildProductionRowWithPhone('9876543213'),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildProducerRow(String name, bool bold) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35.0, 8.0, 8.0, 8.0),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }

  Widget _buildProductionRow(int amount) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 45.0, 16.0),
      child: Text(
        amount.toString(),
        textAlign: TextAlign.right,
      ),
    );
  }

  Widget _buildProducerRowWithPhone(String name) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35.0, 8.0, 8.0, 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            textAlign: TextAlign.left,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildProductionRowWithPhone(String phone) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 35.0, 16.0),
      child: Text(
        phone,
        textAlign: TextAlign.right,
      ),
    );
  }
}

