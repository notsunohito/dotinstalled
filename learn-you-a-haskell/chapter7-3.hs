-- class Eq a where
--     (==) :: a -> a -> Bool
--     (/=) :: a -> a -> Bool
--     x == y = not (x \= y)
--     x /= y = not (x == y)

data TrafficLight = Red | Yellow | Green

instance Eq TrafficLight where
    Red == Red = True
    Green == Green = True
    Yellow == Yellow = True
    _ == _ = False

instance Show TrafficLight where
    show Red = "Red light"
    show Yellow = "Yellow light"
    show Green = "Green light"

-- Red == Red
-- => True
-- Red == Yellow
-- => False
-- Red `elem` [Red, Yellow, Green]
-- => True
-- [Red, Yellow, Green]
-- => [Red light,Yellow light,Green light]

-- instance (Eq m) => Eq (Maybe m) where
--     Just x == Just y = x == y
--     Nothing == Nothing = True
--     _ == _ = False

-- :info Maybe
-- => data Maybe a = Nothing | Just a 	-- Defined in eData.Maybef
--    instance Eq a => Eq (Maybe a) -- Defined in eData.Maybef
--    instance Monad Maybe -- Defined in eData.Maybef
--    instance Functor Maybe -- Defined in eData.Maybef
--    instance Ord a => Ord (Maybe a) -- Defined in eData.Maybef
--    instance Read a => Read (Maybe a) -- Defined in eGHC.Readf
--    instance Show a => Show (Maybe a) -- Defined in eGHC.Showf

class YesNo a where
    yesno :: a -> Bool

instance YesNo Int where
    yesno 0 = False
    yesno _ = True

instance YesNo [a] where
    yesno [] = False
    yesno _  = True

instance YesNo Bool where
    yesno = id

instance YesNo (Maybe a) where
    yesno (Just _) = True
    yesno Nothing  = False

-- instance YesNo (Tree a) where
--     yesno EmptyTree = False
--     yesno _ = True

instance YesNo TrafficLight where
    yesno Red = False
    yesno _ = True

-- yesno $ length []
-- => False
-- yesno "haha"
-- => True
-- yesno ""
-- => False
-- yesno $ Just 0
-- => True
-- yesno True
-- => True
-- yesno []
-- => False
-- yesno [0,0,0]
-- => True
-- :t yesno
-- => yesno :: YesNo a => a -> Bool

yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult =
    if yesno yesnoVal
    then yesResult
    else noResult

-- yesnoIf [] "YEAH!" "NO!"
-- => "NO!"
-- yesnoIf [2,3,4] "YEAH!" "NO!"
-- => "YEAH!"
-- yesnoIf True "YEAH!" "NO!"
-- => "YEAH!"
-- yesnoIf (Just 500) "YEAH!" "NO!"
-- => "YEAH!"
-- yesnoIf Nothing "YEAH!" "NO!"
-- => "NO!"
