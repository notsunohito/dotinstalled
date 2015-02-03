multThree :: Int -> Int -> Int -> Int
multThree x y z = x * y * z

multTwoWithNine :: Int -> Int -> Int
multTwoWithNine y z = let curried = multThree 9 in curried y z

-- compareWithHundred :: Int -> Ordering
-- compareWithHundred x = compare 100 x

compareWithHundred :: Int -> Ordering
compareWithHundred = compare 100

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)
-- divideByTen 200
-- => 20.0
-- 200/10
-- => 20.0
-- (/10) 200
-- => 20.0

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])
-- isUpperAlphanum 'b'
-- => False
-- isUpperAlphanum 'B'
-- => True

-- (-4) => -4
-- (subtract 4)

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

-- applyTwice (+3) 10
-- => 16
-- applyTwice (++ " Haha") "HEY"
-- => "HEY Haha Haha"
-- applyTwice (++ " HAHA") "HEY"
-- => "HEY HAHA HAHA"
-- applyTwice (multThree 2 2 )9
-- => 144
-- applyTwice (3:) [1]
-- => [3,3,1]

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x : xs) (y : ys) = f x y : zipWith' f xs ys

-- zipWith' (+) [4,2,5,6] [2,6,2,3]
-- => [6,8,7,9]
-- zipWith' max [6,3,2,1] [7,3,1,5]
-- => [7,3,2,5]
-- zipWith' (++) ["foo ", "bar ", "baz "] ["fighters", "hoppers", "aldrin"]
-- => ["foo fighters","bar hoppers","baz aldrin"]
-- zipWith' (*) (replicate 5 2) [1..]
-- => [2,4,6,8,10]
-- zipWith' (zipWith' (*)) [[1,2,3],[3,5,6],[2,3,4]] [[3,2,2],[3,4,5],[5,4,3]]
-- => [[3,4,6],[9,20,30],[10,12,12]]

-- flip' :: (a -> b -> c) -> (b -> a -> c)
-- flip' f = g
--     where g x y = f y x
flip' :: (a -> b -> c) -> b -> a -> c
flip' f y x = f x y

-- zip [1,2,3,4,5] "hello"
-- => [(1,'h'),(2,'e'),(3,'l'),(4,'l'),(5,'o')]
-- flip' zip [1,2,3,4,5] "hello"
-- => [('h',1),('e',2),('l',3),('l',4),('o',5)]
-- zipWith div [2,2..] [10,8,6,4,2]
-- => [0,0,0,0,1]
-- zipWith (flip' div) [2,2..] [10,8,6,4,2]
-- => [5,4,3,2,1]

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x : xs) = f x : map' f xs

-- map' (+1) [1,2,3,4,5]
-- => [2,3,4,5,6]
-- map' (+3) [1,5,3,1,6]
-- => [4,8,6,4,9]
-- map' (++ "! ") ["BIFF", "BANG", "POW"]
-- => ["BIFF! ","BANG! ","POW! "]
-- map' (replicate 3) [3..6]
-- => [[3,3,3],[4,4,4],[5,5,5],[6,6,6]]
-- map' (map (^2)) [[1,2],[3,4,5,6],[7,8]]
-- => [[1,4],[9,16,25,36],[49,64]]
-- map' fst [(1,2),(3,5),(6,3),(2,6),(2,5)]
-- => [1,3,6,2,2]

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x : xs)
    | p x        = x : filter' p xs
    | otherwise  = filter' p xs

-- filter' (>3) [1,5,3,2,1,6,4,3,2,1]
-- => [5,6,4]
-- filter' (==3) [1,2,3,4,5]
-- => [3]
-- filter even [1..10]
-- => [2,4,6,8,10]
-- let notNull x = not (null x) in filter' notNull [[1,2,3],[],[3,4,5],[2,2],[],[],[]]
-- => [[1,2,3],[3,4,5],[2,2]]
-- filter' (`elem` ['a'..'z']) "u LaUgh aT mE BeCaUsE I aM diFfeRent"
-- => "uaghameasadifeent"
-- filter' (`elem` ['A'..'Z']) "i LAuGh at you bEcause u R all the same"
-- => "LAGER"

-- filter' (<15) (filter' even [1..20])
-- => [2,4,6,8,10,12,14]
-- [x | x <- [1..20], x < 15, even x]
-- => [2,4,6,8,10,12,14]

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x : xs) =
    let
        smallerOrEqual = filter (<= x) xs
        larger = filter (> x) xs
    in
        quicksort smallerOrEqual ++ [x] ++ quicksort larger

-- quicksort [1,3,5,32,2,6,4]
-- => [1,2,3,4,5,6,32]

largestDivisible :: Integer
largestDivisible = head (filter p [100000, 99999..])
    where p x = x `mod` 3829 == 0
-- largestDivisible
-- => 99554

-- takeWhile (/=' ') "elephants know how to party"
-- => "elephants"
