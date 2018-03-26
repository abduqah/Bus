Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :institution do
        resources :lifts do
          resources :students
          resources :parents
          resources :businfos
          resources :driver
          resources :teacher
        end
        resources :groups
        resources :people
      end
    end
    namespace 'vt' do
      resources :institution
      resources :lifts
      resources :students
      resources :parents
      resources :businfos
      resources :driver
      resources :teacher
      resources :groups
      resources :people
    end
  end
end
