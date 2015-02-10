import Data.Map as Map

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

-- data Bool = False | True deriving (Ord)

-- True `compare` False
-- => GT
-- True > False
-- => True
-- True < False
-- => False

-- Nothing < Just 100
-- => True
-- Nothing > Just (-49999)
-- => False
-- Just 3 `compare` Just 2
-- => GT
-- Just 100 > Just 50
-- => True

data Day = Monday | Tuesday | Wednesday | Thursday | Friday
    | Saturday | Sunday
      deriving (Eq, Ord, Show, Read, Bounded, Enum)

-- Wednesday
-- => Wednesday
-- show Wednesday
-- => "Wednesday"
-- read "Saturday" :: Day
-- => Saturday
-- Saturday == Sunday
-- => False
-- Saturday == Saturday
-- => True
-- Saturday > Friday
-- => True
-- Monday `compare` Wednesday
-- => LT
-- minBound :: Day
-- => Monday
-- maxBound :: Day
-- => Sunday
-- succ Monday
-- => Tuesday
-- pred Saturday
-- => Friday
-- [Thursday .. Sunday]
-- => [Thursday,Friday,Saturday,Sunday]
-- [minBound .. maxBound] :: [Day]
-- => [Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday]

phoneBook :: [(String, String)]
phoneBook =
    [("betty", "555-2938")
    ,("bonnie", "452-2928")
    ,("patsy", "493-2928")
    ,("lucille", "205-2928")
    ,("wendy", "939-8282")
    ,("penny", "853-2492")
    ]

type PhoneNumber = String
type Name = String
type PhoneBook = [(Name, PhoneNumber)]

-- inPhoneBook :: String -> String -> [(String, String)] -> Bool
inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool
inPhoneBook name pnumber pbook = (name, pnumber) `elem` pbook

type AssocList k v = [(k, v)]

-- type IntMap v = Map Int v
type IntMap = Map Int

-- IntMap 3
-- => <interactive>:42:1: Not in scope: data constructor `IntMap'
-- [(1,2),(3,5),(8,9)] :: AssocList Int Int
-- => [(1,2),(3,5),(8,9)]


-- data Either a b = Left a | Right b deriving (Eq, Ord, Read, Show)

-- Right 20
-- => Right 20
-- Left "w00t"
-- => Left "w00t"
-- :t Right 'a'
-- => Right 'a' :: Either a Char
-- :t Left True
-- => Left True :: Either Bool b

data LockerState = Taken | Free deriving (Show, Eq)

type Code = String

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber map =
    case Map.lookup lockerNumber map of
      Nothing -> Left $ "Locker" ++ show lockerNumber
                        ++ " doesn't exist"
      Just (state, code) -> if state /= Taken
                            then Right code
                            else Left $ "Locker " ++ show lockerNumber
                                        ++ " is already taken!"

type LockerMap = Map.Map Int (LockerState, Code)

lockers :: LockerMap
lockers = Map.fromList
     [(100, (Taken, "ZD39I"))
     ,(101, (Free, "JAH3I"))
     ,(103, (Free, "IQSA9"))
     ,(105, (Free, "QOTSA"))
     ,(109, (Taken, "893JJ"))
     ,(110, (Taken, "99292"))
     ]

-- lockerLookup 101 lockers
-- => Right "JAH3I"
-- lockerLookup 100 lockers
-- => Left "Locker 100 is already taken!"
-- lockerLookup 102 lockers
-- => Left "Locker102 doesn't exist"
-- lockerLookup 110 lockers
-- => Left "Locker 110 is already taken!"
-- lockerLookup 105 lockers
-- => Right "QOTSA"

-- data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)
-- data List a = Empty | Cons { listhead:: a, listtail :: List a}
--               deriving (Show, Read, Eq, Ord)

-- Empty
-- => Empty
-- `Cons` Empty
-- => Cons 5 Empty
-- 4 `Cons` (5 `Cons` Empty)
-- => Cons 4 (Cons 5 Empty)
-- 3 `Cons` (4 `Cons` (5 `Cons` Empty))
-- => Cons 3 (Cons 4 (Cons 5 Empty))

infixr 5 :-:
data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)

-- infixr 5 ++
-- (++) :: [a] -> [a] -> [a]
-- []     ++ ys = ys
-- (x:xs) ++ ys = x : (xs ++ ys)

infixr 5 ^++
(^++) :: List a -> List a -> List a
Empty      ^++ ys = ys
(x :-: xs) ^++ ys = x :-: (xs ^++ ys)

-- let a = 3 :-: 4 :-: 5 :-: Empty
-- let b = 6 :-: 7 :-: Empty
-- a ^++ b
-- => 3 :-: (4 :-: (5 :-: (6 :-: (7 :-: Empty))))
