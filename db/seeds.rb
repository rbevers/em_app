# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = [
  {email: 'rbevers@acm.org', password: 'easyToRemember', first_name: 'Russell', last_name: 'Bevers'},
  {email: 'lmiller@emyth.com', password: 'easyToRemember', first_name: 'Lenny', last_name: 'Miller'}
]
users.each do |attribs|
  user = User.find_by_email(attribs[:email])
  if user.present?
    user.update_attributes(attribs)
  else
    User.create(attribs)
  end
end

