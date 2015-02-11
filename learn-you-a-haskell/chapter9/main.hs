-- # main1
-- import Control.Monad
-- import Data.Char

-- main = forever $ do
--     l <- getLine
--     putStrLn $ map toUpper l

-- $ ./main < haiku.txt 
-- I'M LIL' TEAPOT
-- WHAT'S WITH THAT AIRPLANE FOOD, HUH?
-- IT'S SO SMALL, TASTELESS
-- main: <stdin>: hGetLine: end of file


-- # main2
-- import Data.Char

-- main = do
--   contents <- getContents
--   putStr $ map toUpper contents

-- $ ./main < haiku.txt 
-- I'M LIL' TEAPOT
-- WHAT'S WITH THAT AIRPLANE FOOD, HUH?
-- IT'S SO SMALL, TASTELESS

-- $ ./main 
-- hey ho
-- HEY HO
-- lets go
-- LETS GO


-- # main3
-- main = do
--   contents <- getContents
--   putStr (shortLinesOnly contents)

-- shortLinesOnly :: String -> String
-- shortLinesOnly = unlines . filter (\line -> length line < 10) . lines

-- $ ./main < shortlines.txt 
-- i'm short
-- so am i

-- short

-- # main4

-- main = interact shortLinesOnly

-- shortLinesOnly :: String -> String
-- shortLinesOnly = unlines . filter (\line -> length line < 10) . lines


-- # main5
-- main = interact respondPalindromes

-- respondPalindromes :: String -> String
-- respondPalindromes  =
--     unlines . 
--     map (\xs -> if isPal xs then "palindrome" else "not a palindrome") .
--     lines

-- isPal :: String -> Bool
-- isPal xs = xs == reverse xs

-- $ ./main 
-- <- hehe
-- not a palindrome
-- <- ABCBA
-- palindrome
-- <- cookie
-- not a palindrome

-- $ ./main < words.txt 
-- not a palindrome
-- palindrome
-- palindrome
-- palindrome


-- # main6
-- import System.IO

-- main = do
--   handle <- openFile "baabaa.txt" ReadMode
--   contents <- hGetContents handle
--   putStr contents
--   hClose handle

-- $ ./main 
-- Baa, baa, black sheep,
-- Have you any wool?
-- Yes, sir, yes, sir,
-- Three bags full;

import System.IO

main = do
  withFile "baabaa.txt" ReadMode $ \handle -> do
         contents <- hGetContents handle
         putStr contents
