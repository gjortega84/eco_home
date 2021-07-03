part of home_view;

class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;

  _HomeMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            _getActionButton(FontAwesomeIcons.history),
            _getActionButton(FontAwesomeIcons.chartPie),
            _getActionButton(FontAwesomeIcons.wallet),
            _getActionButton(FontAwesomeIcons.hammer),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
    );
  }

  Widget _getActionButton(IconData iconData) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
        child: Icon(iconData),
      ),
      onTap: () {},
    );
  }
}
