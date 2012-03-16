BaixoSom::Application.routes.draw do

    root :to => "bandas#index"
    
    resources :links, :torrents, :votos, :users, :bandas, :albuns, :votos

    match "login" => "users#login"
    match "logout" => "users#logout"    
    match "novo_usuario" => "users#novo"
    match "pesquisa" => "pesquisa#pesquisa"
    match 'sitemap.xml' => "sitemap#sitemap", :defaults => {:format => :xml}

    match 'bandas/:letra' => "bandas#index", :requirements => { :letra => /\w/ }
    match 'nova_banda' => "bandas#new"
    match 'pessoa/:user' => "users#show"
    match 'pessoa/update/:id' => "users#update_status"

    match 'torrents/upload' => "torrents#upload"
    match 'torrent/:fixhash' => 'torrents#show', :requirements => { :fixhash => /\w{40}/ }
    match 'download/:fixhash' => 'torrents#download', :requirements => { :fixhash => /\w{40}/ }

    match ':banda' => "bandas#show"
    match ':banda/novo_album' => "albuns#new"
    match ':banda/:album' => "albuns#show"
    match ':banda/:album/novo_link' => "links#new"

    match 'album/editar/:id' => "albuns#edit"
    match 'album/excluir/:id' => "albuns#excluir"
    match 'album/destroy/:id' => "albuns#destroy"    

end
