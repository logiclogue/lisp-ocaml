let is_surrounded s
    = StringHelpers.head s = Some '"'
    && StringHelpers.last s = Some '"' 

let check_string = is_surrounded

let check_int s = false
