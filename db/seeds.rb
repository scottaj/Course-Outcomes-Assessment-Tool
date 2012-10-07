User.create(username: "tebowt",
            first_name: "Tim",
            last_name: "Tebow",
            password: "abcd1234")
User.create(username: "riversp", 
            first_name: "Phillip",  
            last_name: "Rivers", 
            password: "1234abcd")

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
