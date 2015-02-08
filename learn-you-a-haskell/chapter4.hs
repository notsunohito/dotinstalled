maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list!"
maximum' [x] = x
maximum' (x : xs) = max x (maximum' xs)

-- mine
replicate'' :: Int -> a -> [a]
replicate'' 1 x = (x : [])
replicate'' n x  = x :  replicate (n - 1) x

replicate' n x
    | n <= 0 = []
    | otherwise = x : replicate' (n - 1) x

-- mine
take'' :: Int -> [a] -> [a]
take'' n ls
    | n <= 0 = []
    | otherwise = head ls : take' (n - 1) (tail ls)

take' :: Int -> [a] -> [a]
take' n _
    | n <= 0         = []
take' _ []            = []
take'  n (x : xs) = x : take' (n - 1) xs

reverse'' :: [a] -> [a]
reverse'' [] = []
reverse'' (x : xs) = reverse'' xs ++ [x]

repeat' :: a -> [a]
repeat' x = x : repeat' x

zip' :: [a] -> [b] -> [(a, b)]
zip' _ [] = []
zip' [] _ = []
zip' (x : xs) (y : ys) = (x, y) : zip' xs ys
-- zip' [1,2,3] ['x', 'y', 'z']
-- => [(1,'x'),(2,'y'),(3,'z')]

elem' :: (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (x : xs)
    | a == x     = True
    | otherwise = a `elem'` xs

-- elem' 4 [1,2,3,4,5]
-- => True
-- elem' 10 [1,2,3,4,5]
-- => False

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x : xs) =
    let
        smallerOrEqual = [a | a <- xs, a <= x]
        larger = [a | a <- xs, a > x]
    in
      quicksort smallerOrEqual ++ [x] ++ quicksort larger

--  quicksort [1,213,5,3,5,8,0,-3,7,4,9]
-- => [-3,0,1,3,4,5,5,7,8,9,213]

-- quicksort "joiajsdfoaifjaosfjasofiafohnkjgpdrgpdkr"
-- => "aaaaadddfffffgghiiijjjjjkknooooopprrsss"