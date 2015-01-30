maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list!"
maximum' [x] = x
maximum' (x : xs) = max x (maximum' xs)

-- My Answer
replicate'' :: Int -> a -> [a]
replicate'' 1 x = (x : [])
replicate'' n x  = x :  replicate (n - 1) x
-- Answer
replicate' n x
    | n <= 0 = []
    | otherwise = x : replicate' (n - 1) x