# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

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
      mascot: 'Crimson Tide'
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

Team.create(
  [
    {
      school_id: 1,
      coach: 'Billy Donovan',
      year: 2015,
      conference: 'Southeastern Conference',
      division: 'East'
    },
    {
      school_id: 2,
      coach: 'Mark Fox',
      year: 2015,
      conference: 'Southeastern Conference',
      division: 'East'
    },
    {
      school_id: 3,
      coach: 'John Calipari',
      year: 2015,
      conference: 'Southeastern Conference',
      division: 'East'
    },
    {
      school_id: 4,
      coach: 'Kim Anderson',
      year: 2015,
      conference: 'Southeastern Conference',
      division: 'East'
    },
    {
      school_id: 5,
      coach: 'Frank Martin',
      year: 2015,
      conference: 'Southeastern Conference',
      division: 'East'
    },
    {
      school_id: 6,
      coach: 'Rick Barnes',
      year: 2015,
      conference: 'Southeastern Conference',
      division: 'East'
    },
    {
      school_id: 7,
      coach: 'Kevin Stallings',
      year: 2015,
      conference: 'Southeastern Conference',
      division: 'East'
    },
    {
      school_id: 8,
      coach: 'Avery Johnson',
      year: 2015,
      conference: 'Southeastern Conference',
      division: 'West'
    },
    {
      school_id: 9,
      coach: 'Mike Anderson',
      year: 2015,
      conference: 'Southeastern Conference',
      division: 'West'
    },
    {
      school_id: 10,
      coach: 'Bruce Pearl',
      year: 2015,
      conference: 'Southeastern Conference',
      division: 'West'
    },
    {
      school_id: 11,
      coach: 'Johnny Jones',
      year: 2015,
      conference: 'Southeastern Conference',
      division: 'West'
    },
    {
      school_id: 12,
      coach: 'Ben Howland',
      year: 2015,
      conference: 'Southeastern Conference',
      division: 'West'
    },
    {
      school_id: 13,
      coach: 'Andy Kennedy',
      year: 2015,
      conference: 'Southeastern Conference',
      division: 'West'
    },
    {
      school_id: 14,
      coach: 'Billy Kennedy',
      year: 2015,
      conference: 'Southeastern Conference',
      division: 'West'
    }
  ]
)

