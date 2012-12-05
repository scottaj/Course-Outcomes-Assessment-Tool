### Users ###
User.create(username: "dumblea",
            password: "abcd1234",
            first_name: "Albus",
            last_name: "Dumbledore",
            role: :admin)

User.create(username: "snapes",
            password: "a1b2c3d4",
            first_name: "Severus",
            last_name: "Snape",
            role: :user)

User.create(username: "mcgonam",
            password: "4321dcba",
            first_name: "Minerva",
            last_name: "McGonagal",
            role: :user)

User.create(username: "lupinr",
            password: "1234abcd",
            first_name: "Remus",
            last_name: "Lupin",
            active: false,
            role: :user)

### Courses ###
## Term 1 2012 ##
Course.create(course_name: "Introduction to Transfiguration",
              course_title: "TRNS 101",
              section: 1,
              term_number: 1,
              term_year: 2012,
              professor: User.find_by_username("mcgonam"))

Course.create(course_name: "Introduction to Transfiguration",
              course_title: "TRNS 101",
              section: 2,
              term_number: 1,
              term_year: 2012,
              professor: User.find_by_username("mcgonam"))


## Term 1 2013 ##
Course.create(course_name: "Advanced Transfiguration",
              course_title: "TRNS 400",
              section: 1,
              term_number: 1,
              term_year: 2013,
              professor: User.find_by_username("mcgonam"))

Course.create(course_name: "Introduction to Potions",
              course_title: "POT 101",
              section: 1,
              term_number: 1,
              term_year: 2013,
              professor: User.find_by_username("snapes"))

## Term 2 2011 ##
Course.create(course_name: "Strange Postulations",
              course_title: "MAG 723",
              section: 1,
              term_number: 2,
              term_year: 2011,
              archived: true,
              professor: User.find_by_username("dumblea"))

Course.create(course_name: "Remedial Defence Against the Dark Arts",
              course_title: "DADD 099",
              section: 1,
              term_number: 2,
              term_year: 2011,
              archived: true,
              professor: User.find_by_username("lupinr"))


### Program Outcomes ###
ProgramOutcome.create(outcome: "Perform magical spells")
ProgramOutcome.create(outcome: "Craft Magical items")
ProgramOutcome.create(outcome: "Write detailed academic reports on magical subjects")
ProgramOutcome.create(outcome: "Use magic ethically in everyday life")


### Course Outcomes ###
