type PhoneNumber = String  
type Name = String  

type PhoneBook = [ (Name, PhoneNumber) ]  

phoneBook :: PhoneBook
phoneBook =
    [ 
      ("Betty",   "555-2938"),
      ("Bonnie",  "452-2928"),
      ("Patsy",   "493-2928"),
      ("Lucille", "205-2928"),
      ("Wendy",   "939-8282"),
      ("Penny",   "853-2492")
    ]

inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool
inPhoneBook name pnumber pbook = (name, pnumber) `elem` pbook
