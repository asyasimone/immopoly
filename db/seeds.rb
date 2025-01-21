# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# Ensure the correct order of deletion to avoid foreign key violations

# Ensure the correct order of deletion to avoid foreign key violations
Regulation.destroy_all
Property.destroy_all
Simulation.destroy_all
Project.destroy_all
User.destroy_all
City.destroy_all

# Seed data for cities
cities = City.create!([
  {
    city_name: 'vannes',
    price_per_sqm_livable: 3107,
    price_per_sqm_land: 763,
    price_per_sqm_rental: 10.3
  },
  {
    city_name: 'villejuif',
    price_per_sqm_livable: 3452,
    price_per_sqm_land: 1282,
    price_per_sqm_rental: 15
  }
])

# Seed data for users
users = User.create!([
  {
    email: 'valentin.corger@gmail.com',
    password: 'password123', # Devise will handle encryption
    first_name: 'Valentin',
    last_name: 'CORGER',
    phone_number: '06 87 35 41 23',
    marital_status: 'single',
    ownership_status: 'owner',
    postal_address: '55 avenue de la marne 56000 vannes',
    reset_password_token: nil,
    reset_password_sent_at: nil,
    remember_created_at: nil
  },
  {
    email: 'xuanhuyle@gmail.com',
    password: 'password123', # Devise will handle encryption
    first_name: 'Xuân Huy',
    last_name: 'LÊ de NARP',
    phone_number: '06 87 35 41 23',
    marital_status: 'married',
    ownership_status: 'owner',
    postal_address: '85 avenue paul vaillant-couturier 94800 villejuif',
    reset_password_token: nil,
    reset_password_sent_at: nil,
    remember_created_at: nil
  }
])



# Seed data for properties without associating with projects
properties_vannes = Property.create!([
  {
    city_id: cities[0].id,
    address: '55 avenue de la marne 56000 vannes',
    street_number: 55,
    street_name: 'avenue de la marne',
    zipcode: 56000,
    nb_dwelling: 1,
    area_sqm_land: 516,
    area_sqm_livable: 147,
    floor_area_ratio: 0.23,
    year_construction: 1945,
    building_zone: 'residential',
    density_area: 'mid',
    building_height_floors: 2,
    nb_rooms_per_dwelling: 4,
    energy_class: 'G',
    project_id: nil,
    user_id: users.first.id
  }
])

properties_villejuif = Property.create!([
  {
    city_id: cities[1].id,
    address: '87 avenue paul vaillant-couturier 94800 villejuif',
    street_number: 87,
    street_name: 'avenue paul vaillant-couturier',
    zipcode: 94800,
    nb_dwelling: 3,
    area_sqm_land: 325,
    area_sqm_livable: 150,
    floor_area_ratio: 0.77,
    year_construction: 1945,
    building_zone: 'residential',
    density_area: 'mid',
    building_height_floors: 3,
    nb_rooms_per_dwelling: 6,
    energy_class: 'G',
    project_id: nil,
    user_id: users.second.id
  },
  {
    city_id: cities[1].id,
    address: '85 avenue paul vaillant-couturier 94800 villejuif',
    street_number: 85,
    street_name: 'avenue paul vaillant-couturier',
    zipcode: 94800,
    nb_dwelling: 1,
    area_sqm_land: 253,
    area_sqm_livable: 90,
    floor_area_ratio: 0.58,
    year_construction: 1945,
    building_zone: 'residential',
    density_area: 'mid',
    building_height_floors: 2,
    nb_rooms_per_dwelling: 4,
    energy_class: 'G',
    project_id: nil,
    user_id: users.second.id
  },
  {
    city_id: cities[1].id,
    address: '83 avenue paul vaillant-couturier 94800 villejuif',
    street_number: 83,
    street_name: 'avenue paul vaillant-couturier',
    zipcode: 94800,
    nb_dwelling: 5,
    area_sqm_land: 252,
    area_sqm_livable: nil,
    floor_area_ratio: 0.20,
    year_construction: 1945,
    building_zone: 'residential',
    density_area: 'mid',
    building_height_floors: nil,
    nb_rooms_per_dwelling: nil,
    energy_class: 'G',
    project_id: nil,
    user_id: users.second.id
  },
  {
    city_id: cities[1].id,
    address: '4 rue griffuelhes 94800 villejuif',
    street_number: 4,
    street_name: 'rue griffuelhes',
    zipcode: 94800,
    nb_dwelling: 1,
    area_sqm_land: 252,
    area_sqm_livable: 78,
    floor_area_ratio: 0.15,
    year_construction: 1945,
    building_zone: 'residential',
    density_area: 'mid',
    building_height_floors: 1,
    nb_rooms_per_dwelling: 2,
    energy_class: 'G',
    project_id: nil,
    user_id: users.second.id
  }
])

# Seed data for regulations
Regulation.create!([
  {
    city_id: cities[0].id,
    city_name: 'vannes',
    floor_area_ratio: 0.40,
    building_height: 3,
    housing_social: 0.20,
    housing_affordable: nil,
    housing_market_rate: 0.80
  },
  {
    city_id: cities[1].id,
    city_name: 'villejuif',
    floor_area_ratio: 0.50,
    building_height: 5,
    housing_social: 0.30,
    housing_affordable: nil,
    housing_market_rate: 0.70
  }
])

puts "Cities, Properties, Regulations, Projects, and Users seeded successfully!"
