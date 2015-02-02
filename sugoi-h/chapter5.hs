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

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
    where g x y = f y x



