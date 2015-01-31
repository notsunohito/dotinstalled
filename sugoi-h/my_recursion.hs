doubleNums :: (Num a) => [a] -> [a]
doubleNums [] = []
doubleNums (x : xs) = [x *2] ++ doubleNums xs
-- doubleNums [1,2,3,4,5]
-- => [2,4,6,8,10]
