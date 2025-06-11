enum UserRole { client, store, serviceProvider }

UserRole getUserType(String user) {
  switch (user) {
    case 'client':
      return UserRole.client;
    case 'store_owner':
      return UserRole.store;
    case 'service_provider':
      return UserRole.serviceProvider;
    default:
      return UserRole.client;
  }
}
