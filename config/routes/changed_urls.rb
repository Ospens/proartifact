# frozen_string_literal: true

Rails.application.routes.draw do
  resources :articles do
    collection do
      get '/ischerpyvayushhee-rukovodstvo-po-artifact-ot-betatestera',
          to: redirect('articles/rukovodstvo-po-artifact-ot-betatestera/', status: 301)

      get '/team-liquid-podpisali-dzhorzha-hyped-maganzini/',
          to: redirect('news/team-liquid-podpisali-dzhorzha-hyped-maganzini/', status: 301)
      get '/api-kart-i-kolod-igry-artifact/',
          to: redirect('news/api-kart-i-kolod-igry-artifact/', status: 301)
      get '/richard-garfild-o-zablagovremennykh-ubijstvakh/',
          to: redirect('news/richard-garfild-o-zablagovremennykh-ubijstvakh/', status: 301)
      get '/informaciya-ob-osveshchenii-turnira-artifact/',
          to: redirect('news/informaciya-ob-osveshchenii-turnira-artifact/', status: 301)
      get '/swim-pereklyuchaetsya-na-artifact/',
          to: redirect('news/swim-pereklyuchaetsya-na-artifact/', status: 301)
      get '/razreshyon-restrim-turnira-po-artifact/',
          to: redirect('news/razreshyon-restrim-turnira-po-artifact/', status: 301)
    end
  end
end
