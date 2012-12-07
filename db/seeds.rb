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
            role: :user)
u = User.find_by_username("lupinr")
u.active = false
u.save

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


### Students ###
Student.create(student_id: "T01234567",
               first_name: "Harry",
               last_name: "Potter")
Student.create(student_id: "T01112223",
               first_name: "Ronald",
               last_name: "Weasley")
Student.create(student_id: "T01231234",
               first_name: "Hermione",
               last_name: "Granger")
Student.create(student_id: "T02929292",
               first_name: "Nevil",
               last_name: "Longbottom")
Student.create(student_id: "T06666666",
               first_name: "Draco",
               last_name: "Malfoy")
Student.create(student_id: "T06767767",
               first_name: "Cedric",
               last_name: "Diggory")
Student.create(student_id: "T03334333",
               first_name: "Vincent",
               last_name: "Crabbe")
Student.create(student_id: "T09879789",
               first_name: "Gregory",
               last_name: "Goyle")
Student.create(student_id: "T04565432",
               first_name: "Luna",
               last_name: "Lovegood")
Student.create(student_id: "T09998887",
               first_name: "Ginny",
               last_name: "Weasley")
Student.create(student_id: "T03458761",
               first_name: "Cho",
               last_name: "Chang")
