module Main where

import Control.Lens
import Data.ByteString (ByteString)
import qualified Data.ByteString as ByteString
import Data.Text (Text)
import qualified Data.Text as Text

import Data.Set (Set)
import qualified Data.Set as Set

-- You can import from shared modules defined in src/.
import Lib (someFunc)

main :: IO ()
main =
  interact mySolution

-- | This is a function that has been passed to interact above.
--
-- Tests:
-- >>> mySolution "+1\n+1\n-3"
-- "0"
-- >>> mySolution "+1\n-1\n"
-- "0"
-- >>> mySolution "+3\n+3\n+4\n-2\n-4\n"
-- "10"
-- >>> mySolution "-6\n+3\n+8\n+5\n-6\n"
-- "5"
--
mySolution :: String -> String
mySolution input = show $ findDuplicatedFreq ls
    where ls = cycle $ map parseSignedInt $ lines $ input

findDuplicatedFreq :: (Ord a, Num a, Eq a) => [a] -> a
findDuplicatedFreq xs = findDuplicatedFreq' xs 0 (Set.fromList [0])

findDuplicatedFreq' :: (Ord a, Num a, Eq a) => [a] -> a -> Set a -> a
findDuplicatedFreq' [] _ _ = 666
findDuplicatedFreq' (x:xs) acc pastFreqs
  | Set.member nextFreq pastFreqs = nextFreq
  | otherwise = findDuplicatedFreq' xs nextFreq (Set.insert nextFreq pastFreqs)
  where nextFreq = acc + x

parseSignedInt :: String -> Int
parseSignedInt [] = 0
parseSignedInt ('+':xs) = read xs
parseSignedInt xs = read xs

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
