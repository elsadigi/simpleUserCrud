'use strict'

angular
  .module 'userCrud'
  .config ($urlRouterProvider) ->
    $urlRouterProvider.otherwise '/users'
