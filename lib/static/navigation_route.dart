enum NavigationRoutes{
  login('/login'),
  register('/register'),
  home('/home'),
  profile('/profile');

  const NavigationRoutes(this.route);
  final String route;
}