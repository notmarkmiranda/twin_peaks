admin = Role.create!(title: 'Admin')
u = User.create!(login: '07141206', password: 'password')
puts "#{u.login} created!"


# testing identifiers, remove before submitting to prod
pi = Role.create!(title: 'Primary Investigator')
cc = Role.create!(title: 'Coordinator')
pa = Role.create!(title: 'Patient')

User.create!(login: '123456', password: 'password').roles << pi
User.create!(login: '654321', password: 'password').roles << cc
User.create!(login: '123123', password: 'password').roles << pa
