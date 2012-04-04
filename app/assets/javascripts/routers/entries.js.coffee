class Todos.Routers.Entries extends Backbone.Router
  
  routes:
    ''                  : 'index'
    'entries/:id'       : 'show'
    'entries/:id/edit'  : 'edit'
    'index'            : 'index'

  index: ->
    view = new Todos.Views.EntriesIndex({todos: Todos.todos})
    $('#container').html(view.render().el)

  show: (id) ->
    alert "Entry #{id}"

  edit:(id)->
   view = new Todos.Views.EntriesEdit({model:Todos.todos.get(id)})
   $('#container').html(view.render().el)


    
    
  
   
