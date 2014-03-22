app.service 'ExplanationService', ['IDBStoreFactory', '$q', '$http', 'CacheService', '$log', 'Preferences', (IDBStoreFactory, $q, $http, CacheService, $log, Preferences) ->

    IDBStoreFactory 'resources/translations.json',
        dbVersion: 1
        storeName: 'explanations'
        storePrefix: ''
        keyPath: 'id'
        autoIncrement: no
        indexes: [
            (name: 'id', unique: yes)
            (name: 'country')
            (name: 'language')
        ]

    # properties: database
    # getExplanation: (id) ->
    #     if not Preferences.explanations.enabled then $q.reject 'Explanations disabled' 
    #     else
    #         cached = CacheService.get "trans:#{id}"
    #         if cached
    #             # $log.debug "Translation #{id} retrieved from cache:", cached
    #             $q.when cached
    #         else 
    #             database.then (db) ->
    #                 deferred = $q.defer()
    #                 db.findOne id: id, (err, properties) ->
    #                     if err then deferred.reject err
    #                     else deferred.resolve properties
    #                 deferred.promise
    #             .then (properties) ->
    #                 $q.all [properties, ($http.get "resources/translations/#{properties.file}", cache: yes)]
    #             .then (results) ->
    #                 $log.debug "Translation #{id} response:", results
    #                 properties: results[0]
    #                 content:
    #                     results[1].data.split /\n/g
    #             .then (translation) ->
    #                 # Store in cache
    #                 CacheService.put "trans:#{id}", translation
    #                 translation
]