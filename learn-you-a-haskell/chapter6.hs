import Data.List
import Data.Char
import qualified Data.Map as Map
-- import Data.List hiding (nub)
-- import qualified Data.Map
-- import qualified Data.List as L

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

-- *Main> :m + Data.List
-- *Main Data.List> nub [1,2,3,4,5,1,3,5]
-- => [1,2,3,4,5]

-- *Main> :m + Data.List Data.Map Data.Set
-- *Main Data.List Data.Map Data.Set> 

-- words "hey these are the words in this sentence"
-- => ["hey","these","are","the","words","in","this","sentence"]
-- words "hey these         are    the words in this sentence"
-- ["hey","these","are","the","words","in","this","sentence"]

-- group [1,1,1,1,2,2,2,2,3,3,2,2,2,5,6,7]
-- => [[1,1,1,1],[2,2,2,2],[3,3],[2,2,2],[5],[6],[7]]
-- group ["boom","bip","bip","boom","boom"]
-- => [["boom"],["bip","bip"],["boom","boom"]]

-- sort ["boom","bip","bip","boom","boom"]
-- => ["bip","bip","boom","boom","boom"]

wordNums :: String -> [(String, Int)]
-- wordNums xs = map (\ws -> (head ws, length ws)) (group (sort (words xs)))
wordNums = map (\ws -> (head ws, length ws)) . group . sort . words

-- tails "party"
-- => ["party","arty","rty","ty","y",""]
-- tails [1,2,3]
-- => [[1,2,3],[2,3],[3],[]]

-- "hawaii" `isPrefixOf` "hawaii joe"
-- => True
-- "haha" `isPrefixOf` "ha"
-- => False
-- "ha" `isPrefixOf` "ha"
-- => True

-- any (>4) [1,2,3]
-- => False
-- any (=='F') "Frank Sobotka"
-- => True
-- any (\x -> x > 5 && x < 10) [1,4,11]
-- => False

isIn :: (Eq a) => [a] -> [a] -> Bool
needle `isIn` haystack = any (needle `isPrefixOf`) (tails haystack)

-- "aiueo" `isIn` "kakikukekosasisusesoaiueonaninuneno"
-- => True
-- "aiueo" `isInfixOf` "kakikukekosasisusesoaiueonaninuneno"
-- => True

-- import Data.Char
-- ord 'a'
-- 97
-- chr 97
-- 'a'
-- map ord "abcdefgh"
-- [97,98,99,100,101,102,103,104]


encode :: Int -> String -> String
encode offset msg = map (\c -> chr $ ord c + offset) msg

-- encode 3 "hey mark"
-- => "kh|#pdun"
-- encode 5 "please instruct your men"
-- => "uqjfxj%nsxywzhy%~tzw%rjs"
-- encode 1 "to party hard"
-- => "up!qbsuz!ibse"

decode :: Int -> String -> String
decode shift msg = encode (negate shift) msg

-- decode 3 "kh|#pdun"
-- => "hey mark"

digitSum :: Int -> Int
digitSum = sum . map digitToInt . show

-- :t Just
-- Just :: a -> Maybe a

-- find (>4) [3,4,5,6,7]
-- => Just 5
-- find odd [2,4,6,8,9]
-- => Just 9
-- find (=='z') "mjolnir"
-- => Nothing

firstTo40 :: Maybe Int
firstTo40 = find (\x -> digitSum x == 40) [1..]

-- firstTo40
-- => Just 49999

firstTo :: Int -> Maybe Int
firstTo n = find (\x -> digitSum x == n) [1..]

-- firstTo 50
-- => Just 599999

-- phoneBook =
--     [("betty", "555-2938")
--     ,("bonnie", "452-2928")
--     ,("patsy", "493-2928")
--     ,("lucille", "205-2928")
--     ,("wendy", "939-8282")
--     ,("penny", "853-2492")
--     ]

findKey :: (Eq k) => k -> [(k, v)] -> Maybe v
-- findKey key xs = snd . head . filter (\(k, v) -> key == k) $ xs
findKey key [] = Nothing
-- findKey key ((k, v):xs)
--     | key == k = Just v
--     | otherwise = findKey key xs
findKey key xs = foldr
                   (\(k, v) acc -> if key == k then Just v else acc)
                   Nothing
                   xs

-- Map.fromList [(3,"shoes"),(4,"trees"),(9,"bees")]
-- => fromList [(3,"shoes"),(4,"trees"),(9,"bees")]
-- Map.fromList [("kima","greggs"),("jimmy","mcnulty"),("jay","landsman")]
-- => fromList [("jay","landsman"),("jimmy","mcnulty"),("kima","greggs")]
-- Map.fromList [("MS",1),("MS",2),("MS",3)]
-- => fromList [("MS",3)]

phoneBook :: Map.Map String String
phoneBook = Map.fromList $
    [("betty", "555-2938")
    ,("bonnie", "452-2928")
    ,("patsy", "493-2928")
    ,("lucille", "205-2928")
    ,("wendy", "939-8282")
    ,("penny", "853-2492")
    ]

-- Map.lookup "betty" phoneBook
-- => Just "555-2938"
-- Map.lookup "wendy" phoneBook
-- => Just "939-8282"
-- Map.lookup "grace" phoneBook
-- => Nothing

-- :t Map.insert
-- => Map.insert :: Ord k => k -> a -> Map.Map k a -> Map.Map k a

-- Map.lookup "grace" phoneBook
-- => Nothing
-- let newBook = Map.insert "grace" "341-9021" phoneBook
-- => Map.lookup "grace" newBook
-- Just "341-9021"

-- :t Map.size
-- Map.size :: Map.Map k a -> Int

-- Map.size phoneBook
-- => 6
-- Map.size newBook
-- => 7

string2digits :: String -> [Int]
string2digits = map digitToInt . filter isDigit

-- string2digits "948-9282"
-- => [9,4,8,9,2,8,2]

-- let intBook = Map.map string2digits phoneBook
-- :t intBook
-- => intBook :: Map.Map String [Int]
-- Map.lookup "betty" intBook
-- => Just [5,5,5,2,9,3,8]

phoneBook2 =
    [("betty", "555-2938")
    ,("betty", "342-2492")
    ,("bonnie", "452-2928")
    ,("patsy", "493-2928")
    ,("patsy", "943-2929")
    ,("patsy", "827-9162")
    ,("lucille", "205-2928")
    ,("wendy", "939-8282")
    ,("penny", "853-2492")
    ,("penny", "555-2111")
    ]

-- phoneBookToMap :: (Ord k) => [(k, String)] -> Map.Map k String
-- phoneBookToMap xs = Map.fromListWith add xs
--     where add number1 number2 = number1 ++ ", " ++ number2

-- Map.lookup "patsy" $ phoneBookToMap phoneBook2
-- => Just "943-2929, 493-2928"
-- Map.lookup "wendy" $ phoneBookToMap phoneBook2
-- => Just "939-8282" 
-- Map.lookup "betty" $ phoneBookToMap phoneBook2
-- => Just "342-2492, 555-2938"

phoneBookToMap :: (Ord k) => [(k, a)] -> Map.Map k [a]
phoneBookToMap xs = Map.fromListWith (++) $ map (\(k, v) -> (k, [v])) xs

-- Map.lookup "patsy" $ phoneBookToMap phoneBook2
-- => Just ["827-9162","943-2929","493-2928"]

-- Map.fromListWith max [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11),(4,22),(4,15)]
-- => fromList [(2,100),(3,29),(4,22)]
-- Map.fromListWith (+) [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11),(4,22),(4,15)]
-- => fromList [(2,108),(3,62),(4,37)]
