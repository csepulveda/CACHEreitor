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
      form method: 'post', action: '/playfm', ->
        button class: 'btn btn-success', type: 'submit', formtarget: '_self', formmethod: 'post', 'Limpiar PlayFM'
      form method: 'post', action: '/sonarfm', ->
        button class: 'btn btn-success', type: 'submit', formtarget: '_self', formmethod: 'post', 'Limpiar SonarFM'
      form method: 'post', action: '/top', ->
        button class: 'btn btn-success', type: 'submit', formtarget: '_self', formmethod: 'post', 'Limpiar TopFM'
      form method: 'post', action: '/oasis', ->
        button class: 'btn btn-success', type: 'submit', formtarget: '_self', formmethod: 'post', 'Limpiar OasisFM'
      form method: 'post', action: '/horizonte', ->
        button class: 'btn btn-success', type: 'submit', formtarget: '_self', formmethod: 'post', 'Limpiar Horizonte'
      form method: 'post', action: '/cloudflare', ->
        button class: 'btn btn-danger', type: 'submit', formtarget: '_self', formmethod: 'post', 'Limpiar Cloudflare Radios'
