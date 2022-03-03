import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String, bool?> currentFilters;
  final Function addFilters;
  const Filters(this.currentFilters, this.addFilters, {Key? key})
      : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool _glutenFree = false;

  bool _isVegan = false;

  bool _isLactoseFree = false;

  bool _isVegetarian = false;
  @override
  void initState() {
    super.initState();
    _glutenFree = widget.currentFilters['isGluten'] ?? false;
    _isVegan = widget.currentFilters['isVegan'] ?? false;
    _isLactoseFree = widget.currentFilters['isLactose'] ?? false;
    _isVegetarian = widget.currentFilters['isVegetarian'] ?? false;
  }

  void onChangeValue(bool val, bool filter) {
    setState(() {
      filter = val;
    });
  }

  Widget _buildFilterSwitch(
    String title,
    bool currentValue,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      activeColor: Colors.amber,
      title: Text(title),
      onChanged: updateValue,
      value: currentValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
            onPressed: () => widget.addFilters({
              'isGluten': _glutenFree,
              'isVegan': _isVegan,
              'isVegetarian': _isVegetarian,
              'isLactose': _isLactoseFree,
            }),
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Adjust Your meal selection!',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildFilterSwitch(
                  'Gluten Free',
                  _glutenFree,
                  (val) {
                    setState(
                      () {
                        _glutenFree = val;
                      },
                    );
                  },
                ),
                _buildFilterSwitch(
                  'Vegan',
                  _isVegan,
                  (val) {
                    setState(
                      () {
                        _isVegan = val;
                      },
                    );
                  },
                ),
                _buildFilterSwitch(
                  'Vegetarian',
                  _isVegetarian,
                  (val) {
                    setState(
                      () {
                        _isVegetarian = val;
                      },
                    );
                  },
                ),
                _buildFilterSwitch(
                  'Lactose Free',
                  _isLactoseFree,
                  (val) {
                    setState(
                      () {
                        _isLactoseFree = val;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
