-- # main1
-- main = putStrLn "hello, world"

-- # main1
-- $ ghc --make main.hs
-- $ ./main
-- => hello, world


-- :t putStrLn
-- => putStrLn :: String -> IO ()
-- :t putStrLn "hello, world"
-- => putStrLn "hello, world" :: IO ()

-- :t getLine
-- => getLine :: IO String


-- # main2
-- main = do
--   putStrLn "Hello, what's your name?"
--   name <- getLine
--   putStrLn ("Hey " ++ name ++ ", you rock!")

-- # main2
-- $ ./main
-- => Hello, what's your name?
--    <- Notsu
--    Hey Notsu, you rock!


-- # main3
-- import Data.Char

-- main = do
--   putStrLn "What's your first name?"
--   firstName <- getLine
--   putStrLn "What's your last name?"
--   lastName <- getLine
--   let bigFirstName = map toUpper firstName
--       bigLastName  = map toUpper lastName
--   putStrLn $ "hey " ++ bigFirstName ++ " "
--                     ++ bigLastName
--                     ++ ", how are you?"

-- # main3
-- $ ./main
-- => What's your first name?
--    <- notsu 
--    What's your last name?
--    <- nohito
--    hey NOTSU NOHITO, how are you?


-- # main4
-- main = do
--   line <- getLine
--   if null line
--      then return ()
--      else do
--        putStrLn $ reveseWords line
--        main

-- reveseWords :: String -> String
-- reveseWords = unwords . map reverse . words

-- # main4
-- $ ./main
-- =>
--    <- clean up on aisle number nine
--    naelc pu no elsia rebmun enin
--    <- the goat of error shines a light upon your life
--    eht taog fo rorre senihs a thgil nopu ruoy efil
--    <- it was all a dream
--    ti saw lla a maerd


-- # main5
-- main = do
--   return ()
--   return "HAHAHA"
--   line <- getLine
--   return "BLAH BLAH BLAH"
--   return 4
--   putStrLn line

-- # main5
-- $ ./main
-- =>
--    <- notsu
--    notsu


-- # main6
-- main = do
--   a <- return "hell"
--   b <- return "yeah!"
--   putStrLn $ a ++ " " ++ b

-- main = do
--   let a = "hell"
--       b = "yeah"
--   putStrLn $ a ++ " " ++ b

-- # main6
-- $ ./main 
-- => hell yeah!


-- # main7
-- main = do
--   putStr "Hey, "
--   putStr "I'm "
--   putStrLn "Andy!"

-- # main7
-- $ ./main
-- => Hey, I'm Andy!


-- # main8
-- main = do
--   putChar 't'
--   putChar 'e'
--   putChar 'h'

-- # main8
-- $ ./main 
-- => teh


-- putStr' :: String -> IO ()
-- putStr' [] = return ()
-- putStr' (x:xs) = do
--   putChar x
--   putStr xs


-- # main9
-- main = do
--   print True
--   print 2
--   print "haha"
--   print 3.2
--   print [3,4,3]

-- # main9
-- $ ./main 
-- => True
--    2
--    "haha"
--    3.2
--    [3,4,3]


-- print 3
-- => 3
-- map (++"!") ["hey","ho","woo"]
-- => ["hey!","ho!","woo!"]
-- print $ map (++"!") ["hey","ho","woo"]
-- => ["hey!","ho!","woo!"]


-- import Control.Monad

-- main = do
--   input <- getLine
--   when (input == "SWORDFISH") $ do
--          putStrLn input

-- main = do
--   input <- getLine
--   if (input == "SWORDFISH")
--   then putStrLn input
--        else return ()


-- main = do
--   a <- getLine
--   b <- getLine
--   c <- getLine
--   print [a,b,c]

-- main = do
--   rs <- sequence [getLine,getLine,getLine]
--   print rs


-- sequence $ map print [1,2,3,4,5]
-- => 1
--    2
--    3
--    4
--    5
--    [(),(),(),(),()]

-- mapM print [1,2,3]
-- => 1
--    2
--    3
--    [(),(),()]
-- mapM_ print [1,2,3]
-- => 1
--    2
--    3


-- import Control.Monad
-- import Data.Char

-- main = forever $ do
--     putStr "Give me some input : "
--     l <- getLine
--     putStrLn $ map toUpper l

import Control.Monad

main = do
    colors <- forM [1,2,3,4] $ \a -> do
        putStrLn $ "Which color do you associate with the number "
                 ++ show a ++ "?"
        color <- getLine
        return color
    putStrLn "The colors that you associate with 1, 2, 3 and 4 are: "
    mapM putStrLn colors

-- $ ./main 
-- => Which color do you associate with the number 1?
--    <- blue
--    Which color do you associate with the number 2?
--    <- yellow
--    Which color do you associate with the number 3?
--    <- red
--    Which color do you associate with the number 4?
--    <- black
--    The colors that you associate with 1, 2, 3 and 4 are: 
--    blue
--    yellow
--    red
--    black
