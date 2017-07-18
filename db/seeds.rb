u = User.create!(login: '07141206', password: 'password')
u.roles = [:admin]
puts "#{u.login} created!"
