--{-# OPTIONS -Wall  #-}

lucky :: Int -> String
lucky 7 = "LUCKY NUMBER SEVEN"
lucky x = "Sorry, you're out of luck, pal!"

sayMe :: Int -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5"

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial( n - 1 )
-- factorial 3
-- => 3 * 2 * 1

charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"
charName 'c' = "Cecil"
-- charName 'h'
-- => "*** Exception: chapter3.hs:(20,1)-(22,22): Non-exhaustive patterns in function charName


addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
-- addVectors a b = (fst a + fst b, snd a + snd b)

addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z

xs :: [(Int, Int)]
xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]
-- [a+b| (a, b) <- xs]
-- => [4,7,6,8,11,4]

head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dumy!"
head' (x:_) = x

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x : [])  =  "The list has one element: " ++ show x
tell (x : y : []) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x : y : _) = "This list is long. The first two elements are : " ++ show x ++ " and " ++ show y

badAdd :: (Num a) => [a] -> a
badAdd (x : y : z : []) = x + y + z
-- badAdd [1,2,3,4]
-- => *** Exception: chapter3.hs:59:1-35: Non-exhaustive patterns in function badAdd

firstLetter :: String -> String
firstLetter "" = "Empty string , whoops!"
firstLetter all@(x : xs) = "The first letter of " ++ all ++ " is " ++ [x]

-- bmiTell :: Double -> String
-- bmiTell bmi
--     | bmi <= 18.5 = "You're underweight, you emo, you!"
--     | bmi <= 25.0 = "You're supposedly normal, Pffft, I bet you're ugly!"
--     | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
--     | otherwise    = "You're a whale, congratulations!"

-- bmiTell :: Double -> Double -> String
-- bmiTell weight height
--     | weight / height ^2 <= 18.5 = "You're underweight, you emo, you!"
--     | weight / height ^2 <= 25.0 = "You're supposedly normal, Pffft, I bet you're ugly!"
--     | weight / height ^2 <= 30.0 = "You're fat! Lose some weight, fatty!"
--     | otherwise    = "You're a whale, congratulations!"

max' :: (Ord a) => a -> a -> a
max' a b
    | a <= b = b
    | otherwise = b

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a == b = EQ
    | a <= b = LT
    | otherwise = GT

bmiTell :: Double -> Double -> String
bmiTell weight height
    | bmi <= skinny = "You're underweight, you emo, you!"
    | bmi <= normal = "You're supposedly normal, Pffft, I bet you're ugly!"
    | bmi <= fat = "You're fat! Lose some weight, fatty!"
    | otherwise = "You're a whale, congratulations!"
    where
      bmi = weight / height ^ 2
      skinny = 18.5
      normal = 25.0
      fat = 30.0

-- greet :: String -> String
-- greet "Juan" = niceGreeting ++ " Juan!"
-- greet "Fernando" = niceGreeting ++ " Fernando!"
-- greet name = badGreeting ++ " " ++ name
--     where
--       niceGreeting = "Hellp! So very nice to meet you,"
--       badGreeting = "Oh! Pfft. It's you."
-- => Not working

badGreeting  :: String
badGreeting = "Oh! Pfft. It's you."

niceGreeting :: String
niceGreeting = "Hello! So very nice to see you"

greet :: String -> String
greet "Juan" = niceGreeting ++ " Juan!"
greet "Fernando" = niceGreeting ++ " Fernando!"
greet name = badGreeting ++ " " ++ name

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where
      (f:_) = firstname
      (l:_) = lastname

-- calcBmis :: [ (Double, Double)] -> [Double]
-- calcBmis xs = [bmi w h | (w, h) <- xs]
--     where
--       bmi weight height = weight / height ^ 2

cylinder :: Double -> Double -> Double
cylinder r h =
    let
        sideArea = 2 * pi * r * h
        topArea = pi * r ^ 2
    in
        sideArea + 2 * topArea

-- 4 * (let a = 9 in a + 1) +2
-- => 42

-- [let square x = x * x in (square 5, square 3, square 2)]
-- => [(25,9,4)]

-- (let a = 100; b = 200; c = 300 in a*b*c, let foo = "Hey "; bar = "there!" in foo ++ bar)
-- => (6000000,"Hey there!")

-- (let (a, b, c) = (1, 2, 3) in a+b+c) * 100
-- => 600

calcBmis :: [(Double, Double)] -> [Double]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]

describeList :: [a] -> String
describeList ls = "The list is "
                  ++ case ls of
                       []   -> "empty."
                       [x] -> "a singleton list."
                       xs  -> "a longer list."

describeList' :: [a] -> String
describeList' ls = "The list is " ++ what ls
    where
      what [] = "empty."
      what [x] = "a singleton list."
      what xs = "a longer list."
