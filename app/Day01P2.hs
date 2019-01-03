module Main where

import Control.Lens
import Data.ByteString (ByteString)
import qualified Data.ByteString as ByteString
import Data.Text (Text)
import qualified Data.Text as Text

-- You can import from shared modules defined in src/.
import Lib (someFunc)

main :: IO ()
main =
  interact mySolution

-- | This is a function that has been passed to interact above.
mySolution :: String -> String
mySolution input = show $ findDuplicateFreq ls [0]
    where ls = map parseSignedInt $ lines $ input

findDuplicateFreq :: (Num a, Eq a) => [a] -> [a] -> a
findDuplicateFreq [] _ = 666
findDuplicateFreq xs [] = findDuplicateFreq xs [0]
findDuplicateFreq (x:xs) ys
  | elem (x + (last ys)) ys = x + (last ys)
  | otherwise = findDuplicateFreq (xs ++ [x]) (ys ++ [x + last ys])

parseSignedInt :: String -> Int
parseSignedInt [] = 0
parseSignedInt ('-':xs) = negate (read xs)
parseSignedInt (_:xs) = read xs

-- | This is an example of using doctest.  This is easy to use to test
-- functions you are working on.  It is much lighter weight than using
-- some sort of unit testing framework.
--
-- Basically you just write three greater than signs and an example of calling
-- the function you want to test.  Then on the next line you write what the
-- function returns.
--
-- >>> doctestExample 3
-- 13
--
-- You can run these doctests by running `stack test --fast`.
--
-- You can find out more information about doctest at the following page:
--
-- https://github.com/sol/doctest
doctestExample :: Int -> Int
doctestExample i = i + 10
