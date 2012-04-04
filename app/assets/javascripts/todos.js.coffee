window.Todos =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}   
  init: (todos)->
          @todos = new Todos.Collections.Entries(todos) 
          new Todos.Routers.Entries
          Backbone.history.start()
