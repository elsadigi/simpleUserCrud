'use strict'

angular
  .module 'users'
  .config ($stateProvider) ->
    $stateProvider
      .state 'users',
        url: '/users'
        templateUrl: 'users/views/users.tpl.html'
        controller: 'UsersCtrl'
        controllerAs: 'listCtrl'
