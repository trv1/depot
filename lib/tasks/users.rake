desc "Генерация админа"
namespace :admin do
  task :create=>:environment do
    a=User.create(email: "admin@admin.ru", password: "adminn", phone_number: "123", adress: "q", role: 2)
  end
end