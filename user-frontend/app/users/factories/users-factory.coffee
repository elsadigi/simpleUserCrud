'use strict'

###*
 # @ngdoc service
 # @name users.factory:Users

 # @description

###
angular
  .module 'users'
  .factory 'UsersManager', (
    Restangular
  )->
    UsersBase  =

      transport: Restangular

      url:'api/users'
      newObject: ['name', 'email']
      updateObject:['name', 'email', 'listOrder', 'token']
      newForm:
        [
          key: 'name'
          type: 'input'
          templateOptions:
            label: 'Name'
            placeholder: 'name'
            required: true
            description: 'name'
        ,
          key: 'email'
          type: 'input'
          templateOptions:
            label: 'email'
            placeholder: 'email'
            required: true
            description: 'email'
        ]

      editForm:
        [
          key: 'name'
          type: 'input'
          templateOptions:
            label: 'Name'
            placeholder: 'name'
            required: true
            description: 'name'
        ,
          key: 'email'
          type: 'input'
          templateOptions:
            label: 'Email'
            placeholder: 'email'
            required: true
            description: 'email'
        ,
          key: 'listOrder'
          type: 'input'
          templateOptions:
            label: 'Order'
            placeholder: 'order'
            required: true
            description: 'order'
        ,
          key: 'token'
          type: 'input'
          templateOptions:
            label: 'Token'
            placeholder: 'token'
            required: true
            description: 'token'
        ]

      query:
        "page": 1
        "limit": 5
        "order[list_order]": 'asc'


      getList: (Query)->
        @transport.all(@url).getList(angular.extend({}, @query, Query))

      new: (data) ->
        @transport.all(@url).post(_.pick(data, @newObject))

      update: (id, data) ->
        @transport.one(id).customPUT(_.pick(data, @updateObject))

      delete: (id) ->
        @transport.one(id).remove()

    UsersBase
