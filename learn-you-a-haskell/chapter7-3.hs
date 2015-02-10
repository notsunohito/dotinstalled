import Data.Map


data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show)

singleton' :: a -> Tree a
singleton' x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton' x
treeInsert x (Node a left right)
    | x == a = Node x left right
    | x < a  = Node a (treeInsert x left) right
    | x > a  = Node a left (treeInsert x right)

treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node a left right)
    | x == a = True
    | x < a  = treeElem x left
    | x > a  = treeElem x right

-- let numsTree = Prelude.foldr treeInsert EmptyTree nums
-- numsTree
-- => Node 5
--        (Node 3
--            (Node 1 EmptyTree EmptyTree)
--            (Node 4 EmptyTree EmptyTree)
--        )
--        (Node 7
--            (Node 6 EmptyTree EmptyTree)
--            (Node 8 EmptyTree EmptyTree)
--        )

-- 8 `treeElem` numsTree
-- => True
-- 100 `treeElem` numsTree
-- => False
-- 1 `treeElem` numsTree
-- => True
-- 10 `treeElem` numsTree
-- => False


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

-- :info Functor
-- => class Functor f where
--      fmap :: (a -> b) -> f a -> f b
--      (GHC.Base.<$) :: a -> f b -> f a
--        -- Defined in `GHC.Base'
--    instance Functor (Either a) -- Defined in `Data.Either'
--    instance Functor Maybe -- Defined in `Data.Maybe'
--    instance Functor [] -- Defined in `GHC.Base'
--    instance Functor IO -- Defined in `GHC.Base'
--    instance Functor ((->) r) -- Defined in `GHC.Base'
--    instance Functor ((,) a) -- Defined in `GHC.Base'

-- fmap (*2) [1..3]
-- => [2,4,6]
-- map (*2) [1..3]
-- => [2,4,6]

-- instance Functor Maybe where
--     fmap f (Just x) = Just (f x)
--     fmap f Nothing  = Nothing

-- fmap (++ " HEY GUYS IM INSIDE THE JUST") (Just "Something serious.")
-- => Just "Something serious. HEY GUYS IM INSIDE THE JUST"
-- fmap (++ "HEY GUYS IM INSIDE THE JUST") Nothing
-- => Nothing
-- fmap (*2) (Just 200)
-- => Just 200
-- fmap (*2) Nothing
-- => Nothing

instance Functor Tree where
    fmap f EmptyTree = EmptyTree
    fmap f (Node x left right)
                      = Node (f x) (fmap f left) (fmap f right)
-- fmap (*2) EmptyTree
-- => EmptyTree
-- fmap (*2) (foldr treeInsert EmptyTree [5,7,3])
-- => Node 6
--         EmptyTree
--         (Node 14
--                   (Node 10
--                         EmptyTree
--                         EmptyTree)
--                   EmptyTree)

-- instance Functor (Either a) where
--     fmap f (Right x) = Right (f x)
--     fmap f (Left x)  = Left x

-- :k Int
-- => Int :: *
-- :k Maybe
-- => Maybe :: * -> *
-- :k Maybe Int
-- => Maybe Int :: *
-- :k Either
-- => Either :: * -> * -> *
-- :k Either String
-- => Either String :: * -> *
-- :k Either String Int
-- => Either String Int :: *
