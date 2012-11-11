User.create(username: "tebowt",
            first_name: "Tim",
            last_name: "Tebow",
            password: "abcd1234",
            active: true,
            role: :admin)

User.create(username: "riversp", 
            first_name: "Phillip",  
            last_name: "Rivers", 
            password: "1234abcd",
            active: true,
            role: :user)

Course.create(course_title: "CSSE 171",
              course_name: "Intro Programming I",
              term_number: 1,
              term_year: 2012,
              professor: User.find_by_username("tebowt"))
Course.create(course_title: "CSSE 172",
              course_name: "Intro Programming II",
              term_number: 2,
              term_year: 2012,
              professor: User.find_by_username("riversp"))
Course.create(course_title: "CSSE 171",
              course_name: "Intro Programming I",
              term_number: 1,
              term_year: 2013,
              professor: User.find_by_username("tebowt"))
Student.create(first_name: "Will",
               last_name: "Smith",
               student_id: "T01234567")
Student.create(first_name: "Jimmy",
               last_name: "Johnson",
               student_id: "T07654321")
