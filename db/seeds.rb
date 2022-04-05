# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  'Expo 2020',
  'Dubai Investment Park',
  'Jumeirah Golf Estates',
  'Al Furjan',
  'Discovery Gardens',
  'UAE Exchange',
  'Danube',
  'Energy'
].each do |station|
  Station.create(name: station, zone: 'Zone 1')
end

[
  'Ibn Battutta',
  'DMCC (JLT)',
  'Sobha Realty (Marina)',
  'Al khail',
  'Dubai Internet City',
  'Mashreq',
  'Mall of the Emirates',
  'Umm Al Sheef',
  'Al Safa',
].each do |station|
  Station.create(name: station, zone: 'Zone 2')
end

[
  'Business Bay',
  'Dubai Mall/Burj Khalifa',
  'Financial Center',
  'Emirates Towers',
  'World Trade Center',
  'Max Fashion',
  'ADCB',
  'BURJUMAN',
  'Oud Metha',
  'Health Care City',
  'Jadaf',
  'Creek',
  'Sharaf DG'
].each do |station|
  Station.create(name: station, zone: 'Zone 6')
end

[
  'Al Ras',
  'Gold Souk',
  'Baniyas Square',
  'UNION',
  'Salahuddin',
  'Abu Baker Al Saddique',
  'Abu Hail',
  'Al Qiyadah',
  'Stadium',
  'Al Nahda',
  'Airport Free Zone',
  'Al Qusais',
  'Etisalat',
  'Al Rigga',
  'City Center',
  'GGICO',
  'Airport T1',
  'Airport T3',
  'Emirates',
  'Centerpoint'
].each do |station|
  Station.create(name: station, zone: 'Zone 5')
end





