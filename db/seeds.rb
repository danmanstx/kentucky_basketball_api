# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

School.create(
  [
    {
      name: 'Florida',
      location: 'Gainesville, Florida',
      founded: '1853',
      mascot: 'Gators'
    },
    {
      name: 'Georgia',
      location: 'Athens, Georgia',
      founded: '1785',
      mascot: 'Bulldogs'
    },
    {
      name: 'Kentucky',
      location: 'Lexington, Kentucky',
      founded: '1865',
      mascot: 'Wildcats'
    },
    {
      name: 'Missouri',
      location: 'Columbia, Missouri',
      founded: '1839',
      mascot: 'Tigers'
    },
    {
      name: 'South Carolina',
      location: 'Columbia, South Carolina',
      founded: '1801',
      mascot: 'Gators'
    },
    {
      name: 'Tennessee',
      location: 'Knoxville, Tennessee',
      founded: '1794',
      mascot: 'Volunteers'
    },
    {
      name: 'Vanderbilt',
      location: 'Nashville, Tennessee',
      founded: '1873',
      mascot: 'Commodores'
    },
    {
      name: 'Alabama',
      location: 'Tuscaloosa, Alabama',
      founded: '1831',
      mascot: 'Gators'
    },
    {
      name: 'Arkansas',
      location: 'Fayetteville, Arkansas',
      founded: '1871',
      mascot: 'Razorbacks'
    },
    {
      name: 'Auburn',
      location: 'Auburn, Alabama',
      founded: '1856',
      mascot: 'Tigers'
    },
    {
      name: 'LSU',
      location: 'Baton Rouge, Louisiana',
      founded: '1860',
      mascot: 'Tigers'
    },
    {
      name: 'Mississippi State',
      location: 'Starkville, Mississippi',
      founded: '1878',
      mascot: 'Bulldogs'
    },
    {
      name: 'Mississippi',
      location: 'Oxford, Mississippi',
      founded: '1848',
      mascot: 'Rebels'
    },
    {
      name: 'Texas A&M',
      location: 'College Station, Texas',
      founded: '1876',
      mascot: 'Aggies'
    }
  ]
)
