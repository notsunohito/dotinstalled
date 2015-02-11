-- :t random
-- => random :: (RandomGen g, Random a) => g -> (a, g)

-- random (mkStdGen 100) :: (Int, StdGen)
-- => (-3633736515773289454,693699796 2103410263)
-- random (mkStdGen 100) :: (Int, StdGen)
-- (-3633736515773289454,693699796 2103410263)

-- random (mkStdGen 949494) :: (Int, StdGen)
-- => (6642787099209953655,75809027 2103410263)

-- random (mkStdGen 949488) :: (Float, StdGen)
-- => (0.3718226,1597344447 1655838864)
-- random (mkStdGen 949488) :: (Bool, StdGen)
-- => (False,1485632275 40692)
-- random (mkStdGen 949488) :: (Integer, StdGen)
-- => (9159618695640234475,587416689 2103410263)

-- import System.Random

-- threeCoins :: StdGen => (Bool, Bool, Bool)
-- threeCoins gen =
--     let (firstCoin, newGen) = random gen
--         (secondCoin, newGen') = random newGen
--         (thirdCoin, newGen'') = random newGen'
--     in  (firstCoin, secondCoin, thirdCoin)

-- threeCoins (mkStdGen 21)
-- => (True,True,True)
-- threeCoins (mkStdGen 22)
-- => (True,False,True)
-- threeCoins (mkStdGen 943)
-- => (True,False,True)
-- threeCoins (mkStdGen 944)
-- => (True,True,True)

-- take 5 $ randoms (mkStdGen 11) :: [Int]
-- => [5260538044923710387,4361398698747678847,-8221315287270277529,7278185606566790575,1652507602255180489]
-- take 5 $ randoms (mkStdGen 11) :: [Bool]
-- => [True,True,True,True,False]
-- take 5 $ randoms (mkStdGen 11) :: [Float]
-- => [0.26201087,0.1271351,0.31857032,0.1921351,0.31495118]

-- randoms' :: (RandomGen g, Random a) => g -> [a]
-- randoms' gen = let (value, newGen) = random gen in value:randoms' newGen

-- # なぜかコンパイルできない
-- finiteRandoms :: (RandomGen g, Random a, Num n) => n -> g -> ([a], g)
-- finiteRandoms 0 gen = ([], gen)
-- finiteRandoms n gen =
--     let (value, newGen) = random gen
--         (restOfList, finalGen) = finiteRandoms (n-1) newGen
--     in (value:restOfList, finalGen)

-- :t randomR
-- => randomR :: (RandomGen g, Random a) => (a, a) -> g -> (a, g)

-- randomR (1,6) (mkStdGen 359353)
-- => (6,1494289578 40692)
-- randomR (1,6) (mkStdGen 35935335)
-- => (3,1250031057 40692)
-- take 10 $ randomRs ('a','z') (mkStdGen 3) :: [Char]
-- => "xnuhlfwywq"

-- import System.Random

-- main = do
--     gen <- getStdGen
--     putStrLn $ take 20 (randomRs ('a', 'z') gen)

-- ./random 
-- => ylhlbeuyhqyfrjmuwnju
-- $ ./random 
-- => pwsgtzpnnfgrfglimuwm
-- $ ./random 
-- => dstobmpjwgdsxsaapcpp
-- $ ./random 
-- => iyeyfsxizfvoqbqjybeg

-- import System.Random

-- main = do
--     gen <- getStdGen
--     putStrLn $ take 20 (randomRs ('a','z') gen)
--     gen' <- getStdGen
--     putStrLn $ take 20 (randomRs ('a','z') gen')

-- import System.Random

-- main = do
--     gen <- getStdGen
--     putStrLn $ take 20 (randomRs ('a','z') gen)
--     gen' <- newStdGen
--     putStrLn $ take 20 (randomRs ('a','z') gen')

-- $ ./random 
-- hcvmiutafsyubwmvbemf
-- zjkitpnwdwqwxyqyfdgf

-- import System.Random
-- import Control.Monad(when)

-- main = do
--     gen <- getStdGen
--     let (randNumber, _) = randomR (1, 10) gen :: (Int, StdGen)
--     putStrLn "Which number in the range from 1 to 10 am I thinking of? "
--     numberString <- getLine
--     when (not $ null numberString) $ do
--         let number = read numberString
--             if randNumber == number
--                 then putStrLn "You are correct!"
--                 else putStrLn $ "Sorry, it was " ++ show randNumber
--         newStdGen
--         main
