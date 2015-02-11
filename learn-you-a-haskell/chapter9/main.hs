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

-- import System.IO

-- main = do
--   withFile "baabaa.txt" ReadMode $ \handle -> do
--          contents <- hGetContents handle
--          putStr contents

-- import System.IO
-- import Control.Exception

-- withFile' :: FilePath -> IOMode -> (Handle -> IO a) -> IO a
-- withFile' name mode f = bracket (openFile name mode)
--                         (\handle -> hClose handle)
--                         (\handle -> f handle)


-- # main7
-- import System.IO

-- main = do
--   contents <- readFile "baabaa.txt"
--   putStr contents

-- $ ./main 
-- Baa, baa, black sheep,
-- Have you any wool?
-- Yes, sir, yes, sir,
-- Three bags full;


-- # main8
-- import System.IO
-- import Data.Char

-- main = do
--   contents <- readFile "baabaa.txt"
--   writeFile "baabaacaps.txt" (map toUpper contents)

-- $ ./main
-- $ cat baabaacaps.txt
-- BAA, BAA, BLACK SHEEP,
-- HAVE YOU ANY WOOL?
-- YES, SIR, YES, SIR,
-- THREE BAGS FULL;


-- # main9
-- import System.IO

-- main = do
--   todoItem <- getLine
--   appendFile "todo.txt" (todoItem ++ "\n")

-- $ ./main 
-- Iron the dishes
-- $ ./main
-- Dust the dog
-- $ ./main
-- Take salada out of the oven
-- $ cat todo.txt 
-- Iron the dishes
-- Dust the dog
-- Take salada out of the oven


-- # main10
-- import System.IO
-- import System.Directory
-- import Data.List

-- main = do
--   contents <- readFile "todo.txt"
--   let todoTasks = lines contents
--       numberedTasks = zipWith (\n line -> show n ++ " - " ++ line)
--                                   [0..] todoTasks
--   putStrLn "These are your TO-DO items:"
--   mapM_ putStrLn numberedTasks
--   putStrLn "Which one do you want to delete?"
--   numberString <- getLine
--   let number = read numberString
--       newTodoItems = unlines $ delete (todoTasks !! number) todoTasks
--   (tempName, tempHandle) <- openTempFile "." "temp"
--   hPutStr tempHandle newTodoItems
--   hClose tempHandle
--   removeFile "todo.txt"
--   renameFile tempName "todo.txt"

-- $ ./main 
-- These are your TO-DO items:
-- 0 - Iron the dishes
-- 1 - Dust the dog
-- 2 - Take salada out of the oven
-- Which one do you want to delete?
-- 1
-- $ cat todo.txt 
-- Iron the dishes
-- Take salada out of the oven
-- $ ./main 
-- These are your TO-DO items:
-- 0 - Iron the dishes
-- 1 - Take salada out of the oven
-- Which one do you want to delete?
-- 0
-- $ cat todo.txt 
-- Take salada out of the oven


-- # main11
-- import System.IO
-- import System.Directory
-- import Data.List
-- import Control.Exception

-- main = do
--   contents <- readFile "todo.txt"
--   let todoTasks = lines contents
--       numberedTasks = zipWith (\n line -> show n ++ " - " ++ line)
--                                   [0..] todoTasks
--   putStrLn "These are your TO-DO items : "
--   mapM_ putStrLn numberedTasks
--   putStrLn "Which do you want to delete?"
--   numberString <- getLine
--   let number = read numberString
--       newTodoItems = unlines $ delete (todoTasks !! number) todoTasks
--   bracketOnError (openTempFile "." "temp")
--       (\ (tempName, tempHandle) -> do
--          hClose tempHandle
--          removeFile tempName)

--       (\ (tempName, tempHandle) -> do
--          hPutStr tempHandle newTodoItems
--          hClose tempHandle
--          removeFile "todo.txt"
--          renameFile tempName "todo.txt")


-- # main12
-- import System.Environment
-- import Data.List

-- main = do
--   args <- getArgs
--   progName <- getProgName
--   putStrLn "The arguments are:"
--   mapM_ putStrLn args
--   putStrLn "The program name is:"
--   putStrLn progName

-- $ ./main first second w00t "multi word arg"
-- The arguments are:
-- first
-- second
-- w00t
-- multi word arg
-- The program name is:
-- main


-- # main13

import System.Environment
import System.Directory
import System.IO
import Control.Exception
import Data.List

dispatch :: String -> [String] -> IO ()
dispatch "add" = add
dispatch "view" = view
dispatch "remove" = remove
dispatch "bump" = bump
dispatch command = doesntExist command

main = do
  (command:argList) <- getArgs
  dispatch command argList

add :: [String] -> IO ()
add [fileName, todoItem] = appendFile fileName (todoItem ++ "\n")
add _ = putStrLn "The add command takes exactly two arguments"

view :: [String] -> IO ()
view [fileName] = do
  contents <- readFile fileName
  let todoTasks = lines contents
      numberedTasks = zipWith (\n line -> show n ++ " - " ++ line)
                  [0..] todoTasks
  putStr $ unlines numberedTasks
view _ = putStrLn "The view command takes exactly one arguments"

remove :: [String] -> IO ()
remove [fileName, numberString] = do
  contents <- readFile fileName
  let todoTasks = lines contents
      numberedTasks = zipWith (\n line -> show n ++ " - " ++ line)
                                  [0..] todoTasks
  putStrLn "These are your TO-DO items:"
  mapM_ putStrLn numberedTasks
  let number = read numberString
      newTodoItems = unlines $ delete (todoTasks !! number) todoTasks
  bracketOnError (openTempFile "." "temp")
      (\(tempName, tempHandle) -> do
         hClose tempHandle
         removeFile tempName)
      (\(tempName, tempHandle) -> do
         hPutStr tempHandle newTodoItems
         hClose tempHandle
         removeFile fileName
         renameFile tempName fileName)
remove _ = putStrLn "The remove command takes exactly two arguments"

bump :: [String] -> IO ()
bump [fileName, numberString] = do
  contents <- readFile fileName
  let number = read numberString
      todoTasks = lines contents
      bumpedLine = todoTasks !! number
      newTodoItems = unlines $ bumpedLine : ( delete bumpedLine todoTasks)
  bracketOnError (openTempFile "." "temp")
      (\(tempName, tempHandle) -> do
         hClose tempHandle
         removeFile tempName)
      (\(tempName, tempHandle) -> do
         hPutStr tempHandle newTodoItems
         hClose tempHandle
         removeFile fileName
         renameFile tempName fileName)
bump _ = putStrLn "The bump command takes exactly two arguments"


doesntExist :: String -> [String] -> IO ()
doesntExist command _ =
    putStrLn $ "The " ++ command ++ " command doesn't exist"

-- $ ./main view todo.txt
-- 0 - Iron the dishes
-- 1 - Dust the dog
-- 2 - Take salada out of the oven
-- 3 - 

-- $ ./main view todo.txt
-- 0 - Iron the dishes
-- 1 - Dust the dog
-- 2 - Take salada out of the oven

-- $ ./main add todo.txt "Pick up children from dry cleaner"

-- $ ./main view todo.txt 
-- 0 - Iron the dishes
-- 1 - Dust the dog
-- 2 - Take salada out of the oven
-- 3 - Pick up children from dry cleaner

-- $ ./main remove todo.txt 2

-- $ ./main view todo.txt 
-- 0 - Iron the dishes
-- 1 - Dust the dog
-- 2 - Pick up children from dry cleaner

