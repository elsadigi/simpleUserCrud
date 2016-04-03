'use strict'

###* @ngdoc object
 # @name userCrud
 # @description

###
angular
  .module 'userCrud', [
    'ngMaterial',
    'ui.router',
    'restangular'
    'users',
    'md.data.table',
    'formly'
    'formlyMaterial'
  ]
  .config (
    RestangularProvider
  ) ->
    RestangularProvider.setBaseUrl 'http://localhost:8000'

#   JSON-LD @id support
    RestangularProvider.setRestangularFields
      id: '@id'

    RestangularProvider.setSelfLinkAbsoluteUrl false

#   Hydra collections support
    RestangularProvider.addResponseInterceptor (data, operation) ->
#     Remove trailing slash to make Restangular working
      populateHref = (data) ->
        if (data['@id'])
          data.href = data['@id'].substring(1)

#     Populate href property for the collection
      populateHref(data)

      if ('getList' == operation)
        collectionResponse = data['hydra:member']
        collectionResponse.metadata = {}

#       Put metadata in a property of the collection
        angular.forEach data,  (value, key) ->
          if ('hydra:member' != key)
            collectionResponse.metadata[key] = value

#       Populate href property for all elements of the collection
        angular.forEach collectionResponse, (value) ->
          populateHref(value)

        return collectionResponse


      return data
