-- data Shape = Circle Float Float Float
--            | Rectangle Float Float Float Float
--     deriving (Show)

-- Circle 10 20 10
-- => Circle 10.0 20.0 10.0
-- Rectangle 50 230 60 90
-- => Rectangle 50.0 230.0 60.0 90.0
    
-- area (Circle  _ _ r) = pi * r ^ 2
-- area (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 -y1)

-- area $ Circle 10 20 10
-- => 314.15927
-- area $ Rectangle 0 0 100 100
-- => 10000.0

-- map (Circle 10 20) [4,5,6,6]
-- => [Circle 10.0 20.0 4.0,Circle 10.0 20.0 5.0,Circle 10.0 20.0 6.0,Circle 10.0 20.0 6.0]

data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

area :: Shape -> Float
area (Circle _ r) = pi * r ^ 2
area (Rectangle (Point x1 y1) (Point x2 y2))
    = (abs $ x2 - x1) * (abs $ y2 - y1)

-- area (Rectangle (Point 0 0) (Point 100 100))
-- => 10000.0
-- area (Circle (Point 0 0) 24)
-- => 1809.5574

nudge :: Shape -> Float -> Float -> Shape
nudge (Circle (Point x y) r) a b = Circle (Point (x+a) (y+b)) r
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b
    = Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))

-- nudge (Circle (Point 34 34) 10) 5 10
-- => Circle (Point 39.0 44.0) 10.0

baseCircle :: Float -> Shape
baseCircle r = Circle (Point 0 0) r

baseRect :: Float -> Float -> Shape
baseRect width height = Rectangle (Point 0 0) (Point width height)

-- nudge (baseRect 40 100) 60 23
-- => Rectangle (Point 60.0 23.0) (Point 100.0 123.0)

-- module Shapes
-- ( Point(..)
-- , Shape(..)
-- , area
-- , nudge
-- , baseCircle
-- , baseRect
-- ) where

-- data Person = Person String String Int Float String String
--               deriving (Show)

-- let guy = Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"
-- guy => Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"

-- firstname :: Person -> String
-- firstName (Person firstname _ _ _ _ _) = firstname

-- lastName :: Person -> String
-- lastName (Person _ lastname _ _ _ _) = lastname

-- age :: Person -> Int
-- age (Person _ _ age _ _ _) = age

-- height :: Person -> Float
-- height (Person _ _ _ height _ _) = height

-- phoneNumber :: Person -> String
-- phoneNumber (Person _ _ _ _ number _) = number

-- flavor :: Person -> String
-- flavor (Person _ _ _ _ _ flavor) = flavor

-- let guy = Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"
-- firstName guy
-- => "Buddy"
-- height guy
-- => 184.2
-- flavor guy
-- => "Chocolate"

data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     , height :: Float
                     , phoneNumber :: String
                     , flavor :: String }
              deriving (Show)

-- height guy
-- => 184.2

-- data Car = Car String String Int deriving (Show)

-- Car "Ford" "Mustang" 1967
-- => Car "Ford" "Mustang" 1967

data Car = Car { company :: String
               , model :: String
               , year :: Int }
           deriving (Show)

-- Car {company="Ford", model="Mustang", year=1967}
-- => Car {company = "Ford", model = "Mustang", year = 1967}

-- let car = Car {company = "Ford", model = "Mustang", year = 1967}
-- car{year=2013}
-- => Car {company = "Ford", model = "Mustang", year = 2013}

-- Just "Haha"
-- => Just "Haha"
-- Just 84
-- => Just 84
-- :t Just "Haha"
-- => Just "Haha" :: Maybe [Char]
-- :t Just 84
-- => Just 84 :: Num a => Maybe a
-- :t Nothing
-- => Nothing :: Maybe a
-- Just 10 :: Maybe Double
-- => Just 10.0

tellCar :: Car -> String
tellCar (Car {company = c, model = m, year = y})
            = "This " ++ c ++ " " ++ m ++ " was made in " ++ show y

-- let stang = Car {company="Ford", model="Mustang", year=1967}
-- tellCar stang
-- => "This Ford Mustang was made in 1967"

data Vector a = Vector a a a deriving (Show)

vplus :: (Num a) => Vector a -> Vector a -> Vector a
(Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)

dotProd :: (Num a) => Vector a -> Vector a -> a
(Vector i j k) `dotProd` (Vector l m n) = i*l + j*m + k*n

vmult :: (Num a) => Vector a -> a -> Vector a
(Vector i j k) `vmult` m = Vector (i*m) (j*m) (k*m)

-- Vector 3 5 8 `vplus` Vector 9 2 8
-- => Vector 12 7 16
-- Vector 3 5 8 `vplus` Vector 9 2 8 `vplus` Vector 0 2 3
-- => Vector 12 9 19
-- Vector 3 9 7 `vmult` 10
-- => Vector 30 90 70
-- Vector 4 9 5 `dotProd` Vector 9.0 2.0 4.0
-- => 74.0
-- Vector 2 9 3 `vmult` ( Vector 4 9 5 `dotProd` Vector 9 2 4)
-- => Vector 148 666 222
