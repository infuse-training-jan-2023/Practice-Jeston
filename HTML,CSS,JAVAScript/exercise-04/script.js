const user = {
    name: "Piyush Sharma",
    designation: "Senior Software Engineer",
    company: "Infuse Consulting",
    hobbies: ["Reading", "Listening to music", "Collecting stamps","light"]
}


const printUserProfile = ({name,designation,company,hobbies}=user) => {
    len=hobbies.length
    // Piyush Sharma is a Senior Software Engineer at Infuse Consulting. He likes Reading, Listening to music and Collecting stamps
    console.log(name + " is a " + designation + " at " + company + "." + " He likes " +hobbies.slice(0,len-1)+ " and "+hobbies[len-1]+".");
}

printUserProfile()
