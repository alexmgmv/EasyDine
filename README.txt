*** Description ***

EasyDine is a restaurant table reservation web application with the added functionality of menu choosing during reservation.

EasyDine can be used by three distinct roles: admin, manager, customer.

Chat environment is provided for all users.

Further use of the app requires credentials.

Registration option is provided for customer role.

All passwords are encrypted.

Users with admin role can:
- view, add, remove restaurants
- view, remove registered users
- add users with manager role
- authorize users to manage restaurants
- create database table entries common to all restaurants (restaurant types, & preset menu options)
- perform database maintenance

Users with manager (restaurant’s appointed representative) role can:
- access & edit all restaurant related information (menu, contact details, working hours) except those handled by admin role
- access restaurant reservations
- view customer reviews
- edit account information

Users with customer role can:
- edit account information
- browse available restaurants & use search filters to narrow results
- make table reservations in selected restaurant
- view reservation history and review visited restaurant
- access & modify their submitted reviews
- pay for reservation using app credits



*** Technologies Used ***
- Java 8
- Spring Boot
- Spring Security
- Bootstrap
- WebSocket API
- MySQL
- JavaScript
- CSS
- Java Server Page
