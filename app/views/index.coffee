doctype 5
html ->
  head ->
    meta charset: 'utf-8'
    title 'CACHEreitor'
    meta(name: 'description', content: @description) if @description?

    link rel: 'stylesheet', href: '/css/bootstrap.css'
    script src: 'https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js'
    script src: '/js/bootstrap.js'

  body ->
    div class: 'container', ->
      h1 'CACHEreitor'
      p 'Con CACHEreitor es mas simple limpiar cache ;-)'
      form method: 'post', action: '/varnish', ->
        button class: 'btn btn-danger', type: 'submit', formtarget: '_self', formmethod: 'post', 'Limpiar Varnish Radios'