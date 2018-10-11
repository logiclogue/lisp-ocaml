let is_surrounded s = Helpers.head s = Some '"' && Helpers.last s = Some '"' 

let check_string = is_surrounded

let check_int s = false
