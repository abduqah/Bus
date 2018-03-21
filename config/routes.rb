Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :lifts
      resources :businfos
      resources :drivers
      resources :parents
      resources :people
      resources :students
      resources :teachers
    end
  end
end
