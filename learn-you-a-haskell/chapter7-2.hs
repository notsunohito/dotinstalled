data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int            
                     } deriving (Eq, Show, Read)

mikeD = Person{firstName = "Michael", lastName = "Diamond", age= 43}
adRock = Person{firstName = "Adam", lastName = "Horovitz", age= 41}
mca = Person{firstName = "Adam", lastName = "Yauch", age= 44}

-- mca == adRock
-- => False
-- mikeD == adRock
-- => False
-- mikeD == mikeD
-- => True
-- mikeD == Person {firstName = "Michael", lastName = "Diamond", age = 43}
-- => True

-- let beastieBoys = [mca, adRock, mikeD]
-- mikeD `elem` beastieBoys
-- => True

-- mikeD
-- => Person {firstName = "Michael", lastName = "Diamond", age = 43}
-- "mikeD is: " ++ show mikeD
-- => "mikeD is: Person {firstName = \"Michael\", lastName = \"Diamond\", age = 43}"

mysteryDude = "Person { firstName =\"Michael\"" ++
                     ", lastName =\"Diamond\"" ++
                     ", age = 43}"

-- read mysteryDude :: Person
-- => Person {firstName = "Michael", lastName = "Diamond", age = 43}

-- read mysteryDude == mikeD
-- => True
-- read "Just 3" :: Maybe a
-- => Error
-- read "Just 3" :: Maybe Int
-- => Just 3
