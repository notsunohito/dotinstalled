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
-- sum (takeWhile (<10000) (filter odd (map (^2) [1..])))
-- => 166650
-- sum (takeWhile (<10000) [m | m <- [n^2 | n <- [1..]], odd m])
-- => 166650

chain :: Integer -> [Integer]
chain 1 = [1]
chain n
    | even n = n : chain (n `div` 2)
    | odd n = n : chain (n * 3 + 1)

-- chain 13
-- => [13,40,20,10,5,16,8,4,2,1]
-- chain 10
-- => [10,5,16,8,4,2,1]
-- chain 1
-- => [1]
-- chain 30
-- => [30,15,46,23,70,35,106,53,160,80,40,20,10,5,16,8,4,2,1]

-- numLongChains :: Int
-- numLongChains = length (filter isLong (map chain [1..100]))
--     where
--       isLong xs = length xs > 15
-- numLongChains
-- => 66

listOfFuns :: [Integer -> Integer]
listOfFuns = map (*) [0..]
-- (listOfFuns !! 4) 5
-- => 20
numLongChains :: Int
numLongChains = length (filter (\xs -> length xs > 15)
                                                           (map chain [1..100]))

-- map (+3) [1,6,3,2]
-- => [4,9,6,5]
-- map (\x -> x + 3) [1,6,3,2]
-- => [4,9,6,5]

-- zipWith (\a b -> (a * 30 + 3) / b) [5,4,3,2,1] [1,2,3,4,5]
-- => [153.0,61.5,31.0,15.75,6.6]
-- map (\ (a,b) -> a + b) [(1,2),(3,5),(6,3),(2,6),(2,5)]
-- => [3,8,9,8,7]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

addThree' :: Int -> Int -> Int -> Int
addThree' = \x -> \y -> \z -> x + y + z

flip'' :: (a -> b -> c) -> b -> a -> c
flip'' f = \x y -> f y x
-- zipWith (flip (++)) ["love you", "love me"] ["i ", "you "]
-- => ["i love you","you love me"]
-- map (flip subtract 20) [1,2,3,4]
-- => [19,18,17,16]

-- :t foldl
-- => foldl :: (a -> b -> a) -> a -> [b] -> a
-- :t foldr
-- => foldr :: (a -> b -> b) -> b -> [a] -> b

-- sum' :: (Num a) => [a] -> a
-- sum' xs = foldl (\acc x -> acc + x) 0 xs
sum' :: (Num a) => [a] -> a
sum' = foldl (+) 0
-- sum' [1,2,3,4,5]
-- => 15

map'' :: (a -> b) -> [a] -> [b]
map'' f xs = foldr (\x acc -> f x : acc) [] xs
-- map'' (+3) [1,2,3]
-- => [4,5,6]

elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldr (\x acc -> if x == y then True else acc) False ys

-- :t foldl1
-- => foldl1 :: (a -> a -> a) -> [a] -> a
-- :t foldr1
-- => foldr1 :: (a -> a -> a) -> [a] -> a

maximum' :: (Ord a) => [a] -> a
maximum' = foldl1 max

-- maximum' [1,5,3,6,1]
-- => 6
-- maximum' []
-- => *** Exception: Prelude.foldl1: empty list

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []

reverse'' :: [a] -> [a]
reverse'' = foldl (flip (:)) []

product' :: (Num a) => [a] -> a
product' = foldl (*) 1

filter'' :: (a -> Bool) -> [a] -> [a]
filter'' p = foldr (\x acc -> if p x then x : acc else acc) []

last' :: [a] -> a
last' = foldl1 (\_ x -> x)

-- foldr f z [3,4,5,6]
-- => f 3 (f 4 (f 5 (f 6 z)))
-- foldr (+) 0 [3,4,5,6]
-- => 3 + (4 + (5 + 6 + 0))
-- => (+) 3 ( (+) 4 ( (+) 5 ( (+) 6 0 ) ) )

-- foldl g z [3,4,5,6]
-- => g (g (g (g (g z 3) 4) 5) 6

and' :: [Bool] -> Bool
and' xs = foldr (&&) True xs

-- and' [True,True,True]
-- => True
-- scanl (+) 0 [3,5,2,1]
-- => [0,3,8,10,11]
-- scanr (+) 0 [3,5,2,1]
-- => [11,8,3,1,0]
-- scanl1 (\acc x -> if x > acc then x else acc) [3,4,5,3,7,9,2,1]
-- => [3,4,5,5,7,9,9,9]
-- scanl (flip (:)) [] [3,2,1]
-- => [[],[3],[2,3],[1,2,3]]

sqrtSums :: Int
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1

-- sqrtSums
-- => 131
-- sum (map sqrt [1..131])
-- => 1005.0942035344083
-- sum (map sqrt [1..130])
-- => 993.6486803921487

-- :t ($)
-- => ($) :: (a -> b) -> a -> b
-- => f $ x = f x

-- sum (filter (>10) (map (*2) [2..10]))
-- => 80
-- sum $ filter (>10) $ map (*2) [2..10]
-- => 80
-- map ($ 3) [(4+),(10*),(^2), (sqrt)]
-- => [7.0,30.0,9.0,1.7320508075688772]

-- :t (.)
-- => (.) :: (b -> c) -> (a -> b) -> a -> c
-- f . g = \x -> f (g x)

-- map (\x -> negate (abs x)) [5,-3,-6,7,3,2,-19,24]
-- => [-5,-3,-6,-7,-3,-2,-19,-24]
-- map (negate . abs) [5,-3,-6,7,-3,2,19,24]
-- => [-5,-3,-6,-7,-3,-2,-19,-24]

-- map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]]
-- => [-14,-15,-27]
-- map (negate . sum . tail) [[1..5],[3..6],[1..7]]
-- => [-14,-15,-27]

-- sum (replicate 5 (max 6.7 8.9))
-- => (sum . replicate 5) (max 6.7 8.9)
-- => sum . replicate 5 $ max 6.7 8.9
-- => 44.5

sum'' :: (Num a) => [a] -> a
-- sum'' xs = foldl (+) 0 xs
sum'' = foldl (+) 0

fn :: (Floating a, Integral b, RealFrac a) => a -> b
-- fn x = ceiling (negate (tan (cos (max 50 x))))
fn = ceiling . negate . tan .cos . max 50

oddSquareSum :: Integer
-- oddSquareSum = sum (takeWhile (<10000) (filter odd (map (^2) [1..])))
oddSquareSum = sum . takeWhile (<10000) . filter odd $ map (^2) [1..]
