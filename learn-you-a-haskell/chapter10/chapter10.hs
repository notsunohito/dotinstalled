-- solveRPN :: String -> Double
-- solveRPN = head . foldl foldingFunction [] . words
--     where foldingFunction (x:y:ys) "*" = (y * x):ys
--           foldingFunction (x:y:ys) "+" = (y + x):ys
--           foldingFunction (x:y:ys) "-" = (y - x):ys
--           foldingFunction xs numberString = read numberString:xs

-- solveRPN "10 4 3 + 2 * -"
-- => -4.0
-- solveRPN "2 3.5 +"
-- => 5.5
-- solveRPN "90 34 12 33 55 66 + * - +"
-- => -3947.0
-- solveRPN "90 34 12 33 55 66 + * - + -"
-- => 4037.0
-- solveRPN "90 3.8 -"
-- => 86.2

solveRPN :: String -> Double
solveRPN = head . foldl foldingFunction [] . words
    where foldingFunction (x:y:ys) "*" = (y * x):ys
          foldingFunction (x:y:ys) "+" = (y + x):ys
          foldingFunction (x:y:ys) "-" = (y - x):ys
          foldingFunction (x:y:ys) "/" = (y / x):ys
          foldingFunction (x:y:ys) "^" = (y ** x):ys
          foldingFunction (x:xs) "ln" = log x:xs
          foldingFunction xs "sum" = [sum xs]
          foldingFunction xs numberString = read numberString:xs

-- solveRPN "2.7 ln"
-- => 0.9932517730102834
-- solveRPN "10 10 10 10 sum 4 /"
-- => 10.0
-- solveRPN "10 10 10 10 10 sum 4 /"
-- => 12.5
-- solveRPN "10 2  ^"
-- => 100.0


data Section = Section { getA:: Int, getB :: Int, getC :: Int }
               deriving (Show)

type RoadSystem = [Section]

heathrowToLondon :: RoadSystem
heathrowToLondon = [ Section 50 10 30
                   , Section 5 90 20
                   , Section 40 2 25
                   , Section 10 8 0
                   ]

data Label = A | B | C deriving (Show)
type Path = [(Label, Int)]

roadStep :: (Path, Path) -> Section -> (Path, Path)
roadStep (pathA, pathB) (Section a b c) =
    let timeA = sum (map snd pathA)
        timeB = sum (map snd pathB)
        forwardTimeToA = timeA + a
        crossTimeToA = timeB + b + c
        forwardTimeToB = timeB + b
        crossTimeToB = timeA + a + c
        newPathToA = if forwardTimeToA <= crossTimeToA
                         then (A, a):pathA
                     else (C, c):(B, b):pathB
        newPathToB = if forwardTimeToB <= crossTimeToB
                         then (B, b):pathB
                         else (C, c):(A, a):pathA
    in (newPathToA, newPathToB)

optimalPath :: RoadSystem -> Path
optimalPath roadSystem =
    let (bestAPath, bestBPath) = foldl roadStep ([],[]) roadSystem
    in if sum (map snd bestAPath) <= sum (map snd bestBPath)
           then reverse bestAPath
           else reverse bestBPath

groupsOf :: Int -> [a] => [[a]]
groupsOf 0 _ = undefined
groupsOf _ [] = []
groupsOf n xs = take n xs : groupsOf n (drop n xs)

-- $ ./main < paths.txt 
-- The best path to take is: BCACBBC
-- Time taken: 75
